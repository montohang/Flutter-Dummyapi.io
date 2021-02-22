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
          padding: EdgeInsets.all(defaultMargin - defaultMargin / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: mainColor,
                offset: Offset.zero,
                blurRadius: 0.1,
              ),
            ],
          ),
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
      ],
    );
  }
}
