part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dummy Api"),
      ),
      body: Container(
        child: Text(
          "woiii",
          style: purpleFontStyle,
        ),
      ),
    );
  }
}
