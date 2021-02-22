part of 'widgets.dart';

class TeamListItem extends StatelessWidget {
  final Teams team;
  final double itemWidth;
  TeamListItem({this.team, @required this.itemWidth});

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
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                team.name,
                style: blackFontSytle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                team.formedYear,
                style: greyFontSytle,
                maxLines: 1,
                overflow: TextOverflow.clip,
              )
            ],
          ),
        )
      ],
    );
  }
}
