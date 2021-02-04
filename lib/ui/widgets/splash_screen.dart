part of 'widgets.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget splashScreen = SplashScreenView(
      home: LeaguePage(),
      duration: 3000,
      imageSize: 100,
      imageSrc: "assets/logo.png",
      text: "Sport DB",
      textType: TextType.TyperAnimatedText,
      textStyle: blackFontSytle1.copyWith(color: Colors.white),
      backgroundColor: mainColor,
    );

    return Scaffold(
      body: splashScreen,
    );
  }
}
