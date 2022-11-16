import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:mentai/Screens/LoginScreen/loginscreen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        globalHeader: const Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 16, right: 16),
            ),
          ),
        ),
        globalFooter: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color?>(Colors.blue[500])),
            child: const Text(
              'Let\'s go right away!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                )),
          ),
        ),
        pages: [
          PageViewModel(
            title: "Take Pictures of Yourself",
            body:
                "Track your mental health and mood by taking pictures of yourself",
            image: Lottie.asset('assets/Animations/60265-digital-camera.json'),
            decoration: pageDecoration.copyWith(
              // contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              // fullScreen: true,
              // bodyFlex: 2,
              // imageFlex: 3,
              titleTextStyle: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PageViewModel(
            title: "Your Photo determines your mood",
            body: "The photo you take will give you an assessment of your mood",
            image: Lottie.asset('assets/Animations/94129-baby-girl-moods.json'),
            decoration: pageDecoration.copyWith(
              titleTextStyle: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PageViewModel(
            title: "Get Statistics of your Mood",
            body:
                "Track your mood and mental health with help of our statistics",
            image: Lottie.asset('assets/Animations/99430-statistics.json'),
            decoration: pageDecoration.copyWith(
              // bodyFlex: 2,
              // imageFlex: 4,
              // bodyAlignment: Alignment.bottomCenter,
              // imageAlignment: Alignment.topCenter,
              titleTextStyle: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              bodyTextStyle: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: false,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        //rtl: true, // Display as right-to-left
        back: const Icon(
          Icons.arrow_back,
          color: Color.fromRGBO(144, 202, 249, 1),
        ),
        skip: const Text('Skip',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(144, 202, 249, 1),
            )),
        next: const Icon(
          Icons.arrow_forward,
          color: Color.fromRGBO(144, 202, 249, 1),
        ),
        done: const Text('Done',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(144, 202, 249, 1),
            )),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          activeColor: Color.fromRGBO(144, 202, 249, 1),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
