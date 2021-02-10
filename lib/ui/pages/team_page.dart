part of 'pages.dart';

class TeamPage extends StatefulWidget {
  final String leagueName;

  TeamPage({this.leagueName = ''});

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  TeamCubit teamCubit = TeamCubit();

  @override
  void initState() {
    context.read<TeamCubit>().getTeams(widget.leagueName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Teams',
      subtitle: 'List of the best teams',
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<TeamCubit, TeamState>(
            builder: (_, state) => (state is TeamLoaded)
                ? ListView.builder(
                    itemCount: state.teams.length,
                    itemBuilder: (context, index) {
                      Teams teams = state.teams[index];
                      return Card(
                        elevation: 1,
                        child: ListTile(
                          title: Text(teams.name),
                          subtitle: Text(teams.formedYear),
                          onTap: () {
                            // Get.to();
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
