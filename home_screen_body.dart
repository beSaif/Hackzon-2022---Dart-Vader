import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mentai/Screens/CapturedImageScreen/CapturedImageScreen.dart';
import 'package:mentai/main.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late CameraController controller;
  XFile? imageFile;
  bool imageExist = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras![0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            debugPrint('User denied camera access.');
            break;
          default:
            debugPrint('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Stack(
      children: [
        SizedBox(height: double.infinity, child: CameraPreview(controller)),
        Positioned.fill(bottom: 50, child: _captureControlRowWidget())
      ],
    );
  }

  Widget _captureControlRowWidget() {
    final CameraController? cameraController = controller;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            icon: const Icon(Icons.camera_alt, size: 45, color: Colors.white),
            color: Colors.blue,
            onPressed: cameraController != null &&
                    cameraController.value.isInitialized &&
                    !cameraController.value.isRecordingVideo
                ? onTakePictureButtonPressed
                : null,
          ),
        ),
        // Visibility(
        //     visible: true,
        //     child: Container(
        //       height: 50,
        //       width: 50,
        //       child: imageFile!.path != null
        //           ? Image.file(File(imageFile!.path))
        //           : Container(),
        //     ))
      ],
    );
  }

  void onTakePictureButtonPressed() {
    // show circular progess indicator

    takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          imageFile = file;
          imageExist = true;
          //print(imageFile);
          // Show dialogue

          // videoController?.dispose();
          // videoController = null;
        });
        if (file != null) {
          //showInSnackBar('Picture saved to ${file.path}');
          showGeneralDialog(
              context: context,
              pageBuilder: (BuildContext context, Animation animation,
                  Animation secondaryAnimation) {
                return CapturedImageScreen(
                  imageFile: imageFile!,
                );
              });
        }
      }
    });
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    cameraController!.setFlashMode(FlashMode.off);
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _showCameraException(CameraException e) {
    //_logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}
