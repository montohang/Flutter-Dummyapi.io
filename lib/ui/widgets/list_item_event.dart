part of 'widgets.dart';

class EventListItem extends StatelessWidget {
  final EventsModel event;
  final double itemWidth;

  EventListItem({this.event, @required this.itemWidth});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            height: 130,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(event.thumb),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          child: Column(
            children: [
              Opacity(
                opacity: 0.65,
                child: Container(
                  height: 35,
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 35,
          width: double.infinity,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                event.home,
                style: GoogleFonts.poppins(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                event.homeScore,
                style: GoogleFonts.poppins(
                  color: event.homeScore.toInt() > event.awayScore.toInt()
                      ? mainColor
                      : event.homeScore.toInt() == event.awayScore.toInt()
                          ? mainColor
                          : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                event.awayScore,
                style: GoogleFonts.poppins(
                  color: event.awayScore.toInt() > event.homeScore.toInt()
                      ? mainColor
                      : event.homeScore.toInt() == event.awayScore.toInt()
                          ? mainColor
                          : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                event.away,
                style: GoogleFonts.poppins(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
