part of 'widgets.dart';

class TeamListItem extends StatelessWidget {
  final Teams team;
  final double itemWidth;
  TeamListItem({this.team, @required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              bottom: 10,
            ),
            padding: EdgeInsets.only(
              top: defaultMargin / 2,
              bottom: defaultMargin / 2,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: mainColor,
                    offset: Offset.zero,
                    blurRadius: 0.5,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image(
                    image: NetworkImage(
                      team.badge,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  team.name,
                  style: blackFontSytle2.copyWith(
                    color: mainColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  team.stadium,
                  style: greyFontSytle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  details,
                  style: GoogleFonts.poppins(
                      color: "EB8809".toColor(), fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
