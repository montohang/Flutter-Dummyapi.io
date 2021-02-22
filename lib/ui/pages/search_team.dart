part of 'pages.dart';

class SearchTeamPage extends StatefulWidget {
  @override
  _SearchTeamPageState createState() => _SearchTeamPageState();
}

class _SearchTeamPageState extends State<SearchTeamPage> {
  final _searchTeamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double listItemWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
            controller: _searchTeamController,
            decoration: InputDecoration(
              hintText: "find your team",
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              if (value.length >= 1) {
                context.read<SearchTeamCubit>().searchTeam(value);
              }
            },
            onSubmitted: (value) =>
                context.read<SearchTeamCubit>().searchTeam(value)),
      ),
      body: BlocBuilder<SearchTeamCubit, SearchTeamState>(
        builder: (context, state) {
          if (state is SearchTeamLoaded) {
            return ListView.builder(
              itemCount: state.teams.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    padding: EdgeInsets.only(top: 10),
                    children: state.teams
                        .map(
                          (e) => TeamListItem(
                            team: e,
                            itemWidth: listItemWidth,
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            );
          } else if (state is SearchTeamFailed) {
            return Center(
                child: Text(
              state.message,
            ));
          } else if (state is SearchTeamInitial) {
            return Center(
              child: Text('Type a team name'),
            );
          } else {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: loadingLottieIndicator,
              ),
            );
          }
        },
      ),
    );
  }
}
