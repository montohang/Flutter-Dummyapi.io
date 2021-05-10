part of 'pages.dart';

class SportPage extends StatefulWidget {
  @override
  _SportPageState createState() => _SportPageState();
}

class _SportPageState extends State<SportPage> {
  // LeagueCubit leagueCubit = LeagueCubit();
  SportCubit sportCubit = SportCubit();

  @override
  void initState() {
    // context.read<LeagueCubit>().getLeaguesOfCountry(widget.countryName);
    context.read<SportCubit>().getSports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<SportCubit, SportState>(builder: (context, state) {
      return GeneralPage(
          title: 'Sports',
          subtitle: 'Sport Details',
          child: state is SportLoaded
              ? Container(
                  color: Colors.white,
                  width: width,
                  height: height,
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                        left: defaultMargin, right: defaultMargin),
                    itemCount: state.sports.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: defaultMargin / 2,
                            ),
                            padding: EdgeInsets.only(top: defaultMargin / 2),
                            child: Text(
                              state.sports[index].sportName,
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: mainColor,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: defaultMargin / 2),
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    state.sports[index].sportThumbnail,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: defaultMargin / 2),
                            child: Text(
                              state.sports[index].sportDescription,
                              style: GoogleFonts.poppins(
                                  color: "8D92A3".toColor(),
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              : SizedBox());
    });
  }
}
