part of 'widgets.dart';

class LeagueListItem extends StatelessWidget {
  final League league;
  final double itemWidth;

  LeagueListItem({this.league, @required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: itemWidth - defaultMargin * 2,
          margin: EdgeInsets.only(
            left: defaultMargin,
            bottom: defaultMargin - 10,
          ),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: mainColor,
                offset: Offset.zero,
                blurRadius: 0.5,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        league.name,
                        style: blackFontSytle2.copyWith(
                            color: league.sport == 'Soccer'
                                ? "EB8809".toColor()
                                : Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      Text(
                        league.sport,
                        style: greyFontSytle,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: 30,
                  height: 30,
                  child: league.sport == 'Soccer'
                      ? Image.asset(
                          'assets/soccer.jpg',
                          fit: BoxFit.cover,
                        )
                      : league.sport == 'Motorsport'
                          ? Image.asset(
                              'assets/motorsport.jpg',
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/logo.png',
                              fit: BoxFit.cover,
                            ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
