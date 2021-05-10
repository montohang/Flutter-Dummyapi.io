part of 'pages.dart';

class LeagueDetailsPage extends StatefulWidget {
  final String leagueID;

  LeagueDetailsPage({this.leagueID = ''});

  @override
  _LeagueDetailsPageState createState() => _LeagueDetailsPageState();
}

class _LeagueDetailsPageState extends State<LeagueDetailsPage> {
  LeagueDetailsCubit leagueDetailsCubit = LeagueDetailsCubit();

  @override
  void initState() {
    context.read<LeagueDetailsCubit>().getLeague(widget.leagueID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(initialPage: 1, viewportFraction: 0.7);

    List<String> url = [
      "https://www.thesportsdb.com/images/media/league/fanart/o9c14r1547554186.jpg",
      "https://www.thesportsdb.com/images/media/league/fanart/917urb1547554025.jpg",
      "https://www.thesportsdb.com/images/media/league/fanart/3tjmas1547554302.jpg",
      "https://www.thesportsdb.com/images/media/league/fanart/wmi78w1593611364.jpg",
      "https://www.thesportsdb.com/images/media/league/banner/4m3g4s1520767740.jpg",
      "https://www.thesportsdb.com/images/media/league/badge/pdd43f1610891709.png",
      "https://www.thesportsdb.com/images/media/league/logo/4c377s1535214890.png",
      "https://www.thesportsdb.com/images/media/league/poster/v8d7nf1535455996.jpg",
      "https://www.thesportsdb.com/images/media/league/trophy/yrywtr1422246014.png",
    ];

    double listItemWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - 100;

    return BlocConsumer<LeagueDetailsCubit, LeagueDetailsState>(
      listener: (context, state) {
        if (state is LeagueDetailsLoaded) {
          context.read<EventCubit>().getEvents(
                state.league[0].id,
              );
        }
      },
      builder: (context, state) {
        return GeneralPage(
            title: 'League Details',
            subtitle: 'Details of the best league',
            child: state is LeagueDetailsLoaded
                ? Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 100),
                        height: height,
                        child: SingleChildScrollView(
                          child: Container(
                            color: Colors.white,
                            width: listItemWidth,
                            padding: EdgeInsets.only(
                              left: defaultMargin,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  child: PageView.builder(
                                    controller: pageController,
                                    itemCount: url.length,
                                    itemBuilder: (context, index) {
                                      return Center(
                                        child: Container(
                                          height: 150,
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                              colors: [
                                                Colors.white,
                                                greyColor,
                                                mainColor
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: mainColor,
                                                blurRadius: 1.0,
                                                spreadRadius: 0.5,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                url[index],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(right: defaultMargin),
                                  margin: EdgeInsets.only(
                                      bottom: defaultMargin / 2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.league[0].name,
                                        style: blackFontSytle1,
                                        textAlign: TextAlign.justify,
                                      ),
                                      Text(
                                        'sport : ' + state.league[0].sport,
                                        style: blackFontSytle3.copyWith(
                                            color: orangeColor),
                                        textAlign: TextAlign.justify,
                                      ),
                                      Text(
                                        'formed year : ' +
                                            state.league[0].formed,
                                        style: blackFontSytle3,
                                        textAlign: TextAlign.justify,
                                      ),
                                      Text(
                                        'date first event : ' +
                                            state.league[0].dateFirstEvent,
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
                                                state.league[0].urlWebsite,
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
                                                  state.league[0].urlFacebook,
                                                  style:
                                                      blackFontSytle3.copyWith(
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
                                                  state.league[0].urlTwitter,
                                                  style:
                                                      blackFontSytle3.copyWith(
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
                                                  state.league[0].urlYoutube,
                                                  style:
                                                      blackFontSytle3.copyWith(
                                                          color: orangeColor),
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: defaultMargin / 2),
                                  padding:
                                      EdgeInsets.only(right: defaultMargin),
                                  child: Text(
                                    state.league[0].description,
                                    style: GoogleFonts.poppins(
                                        color: "8D92A3".toColor(),
                                        fontWeight: FontWeight.w300),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        right: defaultMargin,
                                      ),
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                          bottom: defaultMargin),
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
                                                  fontWeight: FontWeight.w500,
                                                  color: mainColor,
                                                ),
                                              ),
                                              Text(
                                                subtitleEvent,
                                                style: GoogleFonts.poppins(
                                                    color: "8D92A3".toColor(),
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                BlocProvider(
                                                  create: (context) =>
                                                      SearchTeamCubit(),
                                                  child: SearchTeamPage(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              details,
                                              style: GoogleFonts.poppins(
                                                  color: "EB8809".toColor(),
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    BlocBuilder<EventCubit, EventState>(
                                      builder: (context, stateEvent) {
                                        return stateEvent is EventLoaded
                                            ? ListView.builder(
                                                primary: false,
                                                shrinkWrap: true,
                                                itemCount:
                                                    stateEvent.events.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                      right: defaultMargin,
                                                    ),
                                                    child: EventListItem(
                                                      event: stateEvent
                                                          .events[index],
                                                      itemWidth: listItemWidth,
                                                    ),
                                                  );
                                                },
                                              )
                                            : SizedBox();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: defaultMargin,
                        right: 0.0,
                        left: defaultMargin,
                        child: Container(
                          padding: EdgeInsets.only(
                            right: defaultMargin,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                TeamPage(
                                  leagueName: state.league[0].name,
                                ),
                              );
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(bottom: defaultMargin / 2),
                              width: listItemWidth,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: mainColor,
                                    offset: Offset.zero,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.5,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text('GET TEAM',
                                    style: blackFontSytle3.copyWith(
                                        color: orangeColor),
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox());
      },
    );
  }
}
