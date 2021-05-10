part of 'widgets.dart';

class SeacrhTeamListItem extends StatelessWidget {
  final Teams team;
  final double itemWidth;
  SeacrhTeamListItem({this.team, @required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        color: mainColor,
        child: Image.network(
          team.badge,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
