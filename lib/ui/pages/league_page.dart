part of 'pages.dart';

class LeaguePage extends StatefulWidget {
  @override
  _LeaguePageState createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  LeagueCubit leagueCubit = LeagueCubit();

  @override
  void initState() {
    context.read<LeagueCubit>().getLeagues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double listItemWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<LeagueCubit, LeagueState>(
      builder: (context, state) {
        return GeneralPage(
            title: 'Leagues',
            subtitle: 'Let’s get list of the best leagues',
            isLoading: !(state is LeagueLoaded),
            actions: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    BlocProvider(
                      create: (context) => SearchTeamCubit(),
                      child: SearchTeamPage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.search,
                ),
              ),
            ],
            child: state is LeagueLoaded
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height -
                        124 -
                        defaultMargin,
                    child: ListView(
                      padding: EdgeInsets.only(top: 10),
                      children: state.leagues
                          .map((e) => GestureDetector(
                                onTap: () {
                                  Get.to(LeagueDetailsPage(
                                    leagueID: e.id,
                                  ));
                                },
                                child: LeagueListItem(
                                  league: e,
                                  itemWidth: listItemWidth,
                                ),
                              ))
                          .toList(),
                    ),
                  )
                : SizedBox());
      },
    );
  }
}
