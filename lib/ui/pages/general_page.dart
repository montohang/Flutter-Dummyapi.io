part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackButtonPressed;
  final List<Widget> actions;
  final Widget child;
  final Color backColor;
  final bool isLoading;

  GeneralPage(
      {this.title,
      this.subtitle,
      this.onBackButtonPressed,
      this.actions,
      this.child,
      this.backColor,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: loadingLottieIndicator,
              ),
            )
          : Stack(
              children: [
                Container(
                  color: Colors.white,
                ),
                SafeArea(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            width: double.infinity,
                            height: 100,
                            color: Colors.white,
                            child: Row(
                              children: [
                                onBackButtonPressed != null
                                    ? GestureDetector(
                                        onTap: () {
                                          if (onBackButtonPressed != null) {
                                            onBackButtonPressed();
                                          }
                                        },
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          margin: EdgeInsets.only(right: 26),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/back_arrow.png'),
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultMargin,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              title,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          (actions == null)
                                              ? SizedBox()
                                              : Row(
                                                  children: actions,
                                                ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      subtitle,
                                      style: GoogleFonts.poppins(
                                          color: "8D92A3".toColor(),
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: defaultMargin,
                            width: double.infinity,
                            color: "#FAFAFC".toColor(),
                          ),
                          child ?? SizedBox()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
