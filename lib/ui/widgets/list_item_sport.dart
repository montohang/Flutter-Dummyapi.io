part of 'widgets.dart';

class SportListItem extends StatelessWidget {
  final SportsModel sports;
  final double itemWidth;

  SportListItem({this.sports, @required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Container(
                  margin: EdgeInsets.only(right: defaultMargin - 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        sports.sportThumbnail,
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: greyColor,
                        offset: Offset.zero,
                        blurRadius: 1.5,
                        spreadRadius: 1.5,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 132,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // sports.sportID.toInt() % 2 == 0 ? orangeColor : mainColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: sports.sportID.toInt() % 2 == 0
                          ? orangeColor
                          : mainColor,
                      offset: Offset.zero,
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(4),
                child: Center(
                  child: Text(
                    sports.sportName,
                    style: blackFontSytle2.copyWith(
                        color: sports.sportID.toInt() % 2 == 0
                            ? mainColor
                            : orangeColor,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
