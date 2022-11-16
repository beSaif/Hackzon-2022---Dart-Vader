import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentai/GetX/users.dart';
import 'package:mentai/Screens/CapturedImageScreen/CapturedImageScreen.dart';
import 'package:mentai/main.dart';

import 'package:tflite/tflite.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  final UsersController usersController =
      Get.put(UsersController(), permanent: false);

  @override
  void initState() {
    super.initState();
    usersController.updateStreaks();
    loadCamera();
    loadModel();
  }

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        cameraController!.initialize().then((_) {
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
        // setState(() {
        //   cameraController!.startImageStream((imageStream) {
        //     cameraImage = imageStream;
        //     runModel();
        //   });
        // });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      for (var element in predictions!) {
        debugPrint("element: $element");

        setState(() {
          output = element['label'];
        });
      }
      debugPrint("prediction: $predictions");
      usersController.updatePhotosTaken();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CapturedImageScreen(
                    predictions: predictions,
                  )));
    }
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/AiModel/FER13.tflite",
      labels: "assets/AiModel/FER13.txt",
    );
  }

  void onTakePictureButtonPressed() async {
    setState(() {
      cameraController!.startImageStream((imageStream) {
        cameraImage = imageStream;
      });
    });
    runModel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: !cameraController!.value.isInitialized
                ? Container()
                : AspectRatio(
                    aspectRatio: cameraController!.value.aspectRatio,
                    child: CameraPreview(cameraController!),
                  ),
          ),
        ),
        Positioned.fill(bottom: 50, child: _captureControlRowWidget())
      ],
    );
  }

  Widget _captureControlRowWidget() {
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
            onPressed:
                cameraController != null ? onTakePictureButtonPressed : null,
          ),
        ),
      ],
    );
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
