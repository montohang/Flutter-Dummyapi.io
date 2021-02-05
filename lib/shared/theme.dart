part of 'shared.dart';

Color mainColor = "1E3658".toColor();
Color greyColor = "CCCFD6".toColor();
Color orangeColor = "EB8809".toColor();

TextStyle purpleFontStyle = GoogleFonts.poppins().copyWith(
  color: greyColor,
);

TextStyle greyFontSytle = GoogleFonts.poppins().copyWith(
  color: greyColor,
);

TextStyle blackFontSytle1 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
  fontSize: 22,
  fontWeight: FontWeight.w500,
);
TextStyle blackFontSytle2 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
TextStyle blackFontSytle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);

const double defaultMargin = 24;

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);
