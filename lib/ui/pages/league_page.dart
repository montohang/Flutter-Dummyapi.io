part of 'pages.dart';

class LeaguePage extends StatefulWidget {
  @override
  _LeaguePageState createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  // List<League> leagues = [];

  LeagueCubit leagueCubit = LeagueCubit();

  @override
  void initState() {
    super.initState();
    context.read<LeagueCubit>().getLeagues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leagues'),
        centerTitle: true,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<LeagueCubit, LeagueState>(
            builder: (_, state) => (state is LeagueLoaded)
                ? ListView(
                    children: [
                      Column(
                        children: state.leagues
                            .map((e) => Card(
                                  elevation: 1,
                                  child: ListTile(
                                    title: Text(e.league),
                                    subtitle: Text(e.sport),
                                    onTap: () {
                                      Get.to(LeagueDetailPage());
                                    },
                                  ),
                                ))
                            .toList(),
                      )
                    ],
                  )
                : Center(child: loadingIndicator),
          )),
    );
  }
}
