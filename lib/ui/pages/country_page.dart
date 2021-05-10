part of 'pages.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    List<String> countryNameList = [
      'England',
      'France',
      'Germany',
      'Indonesia',
      'Italy',
      'Spain',
    ];

    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: orangeColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.12,
          ),
          Text(
            'Fvckn Leagues',
            style: blackFontSytle1,
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(
                  defaultMargin,
                ),
                child: ListView.builder(
                  itemBuilder: (_, index) => CountryWidgetModel(
                    countryName: countryNameList[index],
                  ),
                  itemCount: countryNameList.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
