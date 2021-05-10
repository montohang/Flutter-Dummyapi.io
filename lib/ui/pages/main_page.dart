part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SportCubit sportCubit = SportCubit();
  LeagueCubit leagueCubit = LeagueCubit();

  @override
  void initState() {
    context.read<SportCubit>().getSports();
    context.read<LeagueCubit>().getLeagues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<SportCubit, SportState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              titleApp,
              style: blackFontSytle1.copyWith(color: mainColor),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 4.0,
            leading: IconButton(
              icon: Icon(
                EvaIcons.menu2Outline,
                color: mainColor,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(
                  EvaIcons.searchOutline,
                  color: mainColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                /// section sport
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        width: double.infinity,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  titleSport,
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: mainColor,
                                  ),
                                ),
                                Text(
                                  subtitleSport,
                                  style: GoogleFonts.poppins(
                                      color: "8D92A3".toColor(),
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(SportPage());
                              },
                              child: Text(
                                details,
                                style: GoogleFonts.poppins(
                                  color: "EB8809".toColor(),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 220,
                        margin: EdgeInsets.only(
                          left: defaultMargin,
                        ),
                        child: state is SportLoaded
                            ? Row(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      primary: true,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.sports.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () {
                                          Get.to(SportPage());
                                        },
                                        child: SportListItem(
                                          sports: state.sports[index],
                                          itemWidth: width,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                      ),
                    ],
                  ),
                ),

                /// section league
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                titleLeague,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: mainColor,
                                ),
                              ),
                              Text(
                                subtitleLeague,
                                style: GoogleFonts.poppins(
                                    color: "8D92A3".toColor(),
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                BlocProvider(
                                  create: (context) => SearchTeamCubit(),
                                  child: SearchTeamPage(),
                                ),
                              );
                            },
                            child: Text(
                              find,
                              style: GoogleFonts.poppins(
                                  color: "EB8809".toColor(),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      child: BlocBuilder<LeagueCubit, LeagueState>(
                        builder: (context, state) {
                          return state is LeagueLoaded
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height - 124,
                                  child: ListView(
                                    primary: true,
                                    shrinkWrap: false,
                                    padding: EdgeInsets.only(top: 10),
                                    children: state.leagues
                                        .map((e) => GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                  MultiBlocProvider(
                                                    child: LeagueDetailsPage(
                                                      leagueID: e.id,
                                                    ),
                                                    providers: [
                                                      BlocProvider(
                                                        create: (context) =>
                                                            EventCubit(),
                                                      ),
                                                      BlocProvider(
                                                        create: (context) =>
                                                            LeagueDetailsCubit(),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: LeagueListItem(
                                                league: e,
                                                itemWidth: width,
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )
                              : SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
