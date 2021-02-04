part of 'shared.dart';

Color mainColor = "580559".toColor();
Color purpleTextColor = "682769".toColor();
Color greyColor = "8D92A3".toColor();

TextStyle purpleFontStyle = GoogleFonts.poppins().copyWith(
  color: purpleTextColor,
);
TextStyle greyFontSytle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontSytle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontSytle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontSytle3 = GoogleFonts.poppins().copyWith(color: Colors.black);

const double defaultMargin = 24;

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);
