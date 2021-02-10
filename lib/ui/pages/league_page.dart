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
    return GeneralPage(
      title: 'Leagues',
      subtitle: 'Let’s get list of the best leagues',
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<LeagueCubit, LeagueState>(
            builder: (_, state) => (state is LeagueLoaded)
                ? ListView.builder(
                    itemCount: state.leagues.length,
                    itemBuilder: (context, index) {
                      League league = state.leagues[index];
                      return Card(
                        elevation: 1,
                        child: ListTile(
                          title: Text(league.name),
                          subtitle: Text(league.sport),
                          onTap: () {
                            Get.to(TeamPage(
                              leagueName: league.name,
                            ));
                          },
                        ),
                      );
                    })
                : Center(
                    child: loadingIndicator,
                  ),
          )),
    );
  }
}
