part of 'pages.dart';

class LeagueOfCountryPage extends StatefulWidget {
  final String leagueName;

  LeagueOfCountryPage({this.leagueName = ''});
  @override
  _LeagueOfCountryPageState createState() => _LeagueOfCountryPageState();
}

class _LeagueOfCountryPageState extends State<LeagueOfCountryPage> {
  // LeaguesOfCountryCubit leagueCubit = LeaguesOfCountryCubit();
  LeaguesOfCountryCubit leaguesOfCountryCubit;

  LeaguesOfCountry leaguesOfCountry;
  // _LeagueOfCountryPageState(this.leaguesOfCountry);

  @override
  void initState() {
    context
        .read<LeaguesOfCountryCubit>()
        .getLeaguesOfCountry(widget.leagueName);
    // leaguesOfCountryCubit.getLeaguesOfCountry(leaguesOfCountry.id);
    // leaguesOfCountryCubit = BlocProvider.of<LeaguesOfCountryCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Leagues of Country',
      subtitle: 'Let’s get list of the best leagues',
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<LeaguesOfCountryCubit, LeaguesOfCountryState>(
            builder: (_, state) => (state is LeaguesOfCountryLoaded)
                ? ListView.builder(
                    itemCount: state.leaguesOfCountry.length,
                    itemBuilder: (context, index) {
                      LeaguesOfCountry league = state.leaguesOfCountry[index];
                      return Card(
                        elevation: 1,
                        child: ListTile(
                          title: Text(league.name),
                          subtitle: Text(league.formedYear),
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
