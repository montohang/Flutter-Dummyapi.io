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
    double listItemWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<TeamCubit, TeamState>(
      builder: (context, state) {
        return GeneralPage(
            title: 'Teams',
            subtitle: 'List of the best teams',
            isLoading: !(state is TeamLoaded),
            child: state is TeamLoaded
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height:
                        MediaQuery.of(context).size.height - defaultMargin - 90,
                    child: GridView.builder(
                      padding: EdgeInsets.all(
                        defaultMargin,
                      ),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 2 / 3,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: state.teams.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(TeamDetailsPage(
                            teamID: state.teams[index].id,
                          ));
                        },
                        child: TeamListItem(
                          team: state.teams[index],
                          itemWidth: listItemWidth,
                        ),
                      ),
                    ))
                : SizedBox());
      },
    );
  }
}
