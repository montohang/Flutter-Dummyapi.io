part of 'pages.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget splashScreen = SplashScreenView(
      home: MainPage(),
      duration: 3000,
      imageSize: 125,
      imageSrc: "assets/logo.png",
      textStyle: blackFontSytle1.copyWith(color: Colors.white),
      backgroundColor: mainColor,
    );

    return Scaffold(
      body: splashScreen,
    );
  }
}
