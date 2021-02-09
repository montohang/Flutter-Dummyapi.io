part of 'pages.dart';

class LeagueOfCountryPage extends StatefulWidget {
  // final LeaguesOfCountry leaguesOfCountry;

  // LeagueOfCountryPage({this.leaguesOfCountry});
  @override
  _LeagueOfCountryPageState createState() => _LeagueOfCountryPageState();
}

class _LeagueOfCountryPageState extends State<LeagueOfCountryPage> {
  LeaguesOfCountryCubit leagueCubit =
      BlocProvider.of<LeaguesOfCountryCubit>(context);

  LeaguesOfCountry leaguesOfCountry;
  // _LeagueOfCountryPageState(this.leaguesOfCountry);

  @override
  void initState() {
    context
        .read<LeaguesOfCountryCubit>()
        .getLeaguesOfCountry(leaguesOfCountry.id);
    //     .read<LeaguesOfCountryCubit>()
    //     .getLeaguesOfCountry(leaguesOfCountry.id);

    // LeaguesOfCountryCubit.getLeaguesOfCountry(leaguesOfCountry.id);

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
