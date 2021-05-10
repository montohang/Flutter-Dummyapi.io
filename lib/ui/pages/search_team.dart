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
    return BlocBuilder<SearchTeamCubit, SearchTeamState>(
      builder: (context, state) {
        return GeneralPage(
            title: 'Search',
            subtitle: 'Find your team',
            onBackButtonPressed: () {
              Get.back();
            },
            child: Stack(children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView(children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(
                      defaultMargin,
                      0,
                      defaultMargin,
                      defaultMargin,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: mainColor,
                          offset: Offset.zero,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchTeamController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "find your favorite team",
                          labelStyle: greyFontSytle),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      onChanged: (value) {
                        if (value.length >= 1) {
                          context.read<SearchTeamCubit>().searchTeam(value);
                        }
                      },
                      onSubmitted: (value) =>
                          context.read<SearchTeamCubit>().searchTeam(value),
                    ),
                  ),
                  state is SearchTeamLoaded
                      ? Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height - 202,
                          color: Colors.white,
                          child: StaggeredGridView.countBuilder(
                            crossAxisCount: 3,
                            itemCount: state.teams.length,
                            itemBuilder: (context, index) => SeacrhTeamListItem(
                              team: state.teams[index],
                              itemWidth: listItemWidth,
                            ),
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.count((index % 7 == 0) ? 2 : 1,
                                    (index % 7 == 0) ? 2 : 1),
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 2.0,
                          ),
                        )
                      : state is SearchTeamFailed
                          ? Center(
                              child: Text(
                              state.message,
                            ))
                          : state is SearchTeamInitial
                              ? Center(
                                  child: Text('Type a team name'),
                                )
                              : Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    child: loadingLottieIndicator,
                                  ),
                                ),
                ]),
              ),
            ]));
      },
    );
  }
}
