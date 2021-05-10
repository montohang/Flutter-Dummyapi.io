part of 'pages.dart';

class TeamDetailsPage extends StatefulWidget {
  final String teamID;

  TeamDetailsPage({this.teamID = ''});

  @override
  _TeamDetailsPageState createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  TeamDetailsCubit teamDetailsCubit = TeamDetailsCubit();

  @override
  void initState() {
    context.read<TeamDetailsCubit>().getTeam(widget.teamID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double listItemWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocBuilder<TeamDetailsCubit, TeamDetailsState>(
      builder: (context, state) {
        return GeneralPage(
            title: 'Team Details',
            subtitle: 'Details of the best team',
            isLoading: !(state is TeamDetailsLoaded),
            child: state is TeamDetailsLoaded
                ? SingleChildScrollView(
                    // primary: true,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: defaultMargin,
                            right: defaultMargin,
                          ),
                          color: Colors.white,
                          width: listItemWidth,
                          // height: MediaQuery.of(context).size.height - 124,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(bottom: defaultMargin / 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                          bottom: defaultMargin / 2),
                                      height: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              state.team[0].badge,
                                            ),
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                    Text(
                                      state.team[0].name,
                                      style: blackFontSytle1,
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      state.team[0].nameAlternate,
                                      style: blackFontSytle3.copyWith(
                                          color: orangeColor),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      'formed year : ' +
                                          state.team[0].formedYear,
                                      style: blackFontSytle3,
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      'stadium : ' + state.team[0].stadium,
                                      style: GoogleFonts.poppins(
                                          color: "8D92A3".toColor(),
                                          fontWeight: FontWeight.w300),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: defaultMargin / 2),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: defaultMargin / 2),
                                            width: listItemWidth,
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: orangeColor,
                                                  offset: Offset.zero,
                                                  blurRadius: 0.5,
                                                  spreadRadius: 0.5,
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              state.team[0].urlWebsite,
                                              style: blackFontSytle3.copyWith(
                                                  color: mainColor),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: defaultMargin / 2),
                                            width: listItemWidth,
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: mainColor,
                                                  offset: Offset.zero,
                                                  blurRadius: 0.5,
                                                  spreadRadius: 0.5,
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                                state.team[0].urlInstagram,
                                                style: blackFontSytle3.copyWith(
                                                    color: orangeColor),
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: defaultMargin / 2),
                                            width: listItemWidth,
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: orangeColor,
                                                  offset: Offset.zero,
                                                  blurRadius: 0.5,
                                                  spreadRadius: 0.5,
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                                state.team[0].urlTwitter,
                                                style: blackFontSytle3.copyWith(
                                                    color: mainColor),
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Container(
                                            width: listItemWidth,
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: mainColor,
                                                  offset: Offset.zero,
                                                  blurRadius: 0.5,
                                                  spreadRadius: 0.5,
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                                state.team[0].urlYoutube,
                                                style: blackFontSytle3.copyWith(
                                                    color: orangeColor),
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: defaultMargin / 2),
                                            child: Text(
                                              state.team[0].description,
                                              style: GoogleFonts.poppins(
                                                  color: "8D92A3".toColor(),
                                                  fontWeight: FontWeight.w300),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          // padding: EdgeInsets.only(left: defaultMargin),
                                          width: double.infinity,
                                          margin: EdgeInsets.only(
                                              left: 0, bottom: defaultMargin),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    titleEvent,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    subtitleEvent,
                                                    style: GoogleFonts.poppins(
                                                        color:
                                                            "8D92A3".toColor(),
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                details,
                                                style: GoogleFonts.poppins(
                                                    color: "EB8809".toColor(),
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: defaultMargin),
                                            width: double.infinity,
                                            child: BlocBuilder<EventTeamCubit,
                                                EventTeamState>(
                                              builder: (context, stateTeam) {
                                                context
                                                    .read<EventTeamCubit>()
                                                    .getEventTeam(
                                                        state.team[0].id);
                                                return stateTeam
                                                        is EventTeamLoaded
                                                    ? Container(
                                                        height: height -
                                                            defaultMargin -
                                                            400,
                                                        child: ListView.builder(
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          itemCount: stateTeam
                                                              .events.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return EventTeamListItem(
                                                              event: stateTeam
                                                                      .events[
                                                                  index],
                                                              itemWidth:
                                                                  listItemWidth,
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : SizedBox();
                                              },
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox());
      },
    );
  }
}
