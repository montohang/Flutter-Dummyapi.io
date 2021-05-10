part of 'widgets.dart';

class CountryWidgetModel extends StatelessWidget {
  final String countryName;

  const CountryWidgetModel({Key key, this.countryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      child: GestureDetector(
        onTap: () {
          // Get.to(SportPage(
          //   countryName: countryName,
          // ));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.hardEdge,
          child: Container(
            color: mainColor,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    countryName,
                    style: greyFontSytle,
                  ),
                  Image.asset(
                    'assets/right_arrow.png',
                    width: width * 0.1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
