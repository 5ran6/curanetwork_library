import 'package:curanetwork_library/imports/imports.dart';

/*This class have all colors that are used in the application.
  For example if i needed to access the "primaryColor" I would
  use "Theme.of(context).primaryColor"*/
class AppTheme {
  AppTheme._();
  final primaryColor = Color(0XFF317CFB);
  final whiteColor = Color(0XFFFFFFFF);
  static final greyColor1 = Color(0XFF5B5B5B);
  static final greyColor2 = Color(0XFF6B6B6B);

  //Headline1
  static final kHeadline1 = TextStyle(
      color: kBlackColor,
      fontSize: ScreenUtil().setSp(22),
      fontWeight: FontWeight.w700);

  //Headline 2
  static final kHeadline2 = TextStyle(
    color: Colors.white,
    fontSize: ScreenUtil().setSp(16),
  );

  //Body Text style
  static final kBodyTextStyle = TextStyle(
    color: kDescriptionTextColor,
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.w400,
  );

  //Button TextStyle
  static final kButtonTextStyle = TextStyle(
    color: kWhiteColor,
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.w700,
  );

  //
  static final kBottomLabelUnselectedTextStyle = TextStyle(
    color: kDescriptionTextColor,
    fontSize: ScreenUtil().setSp(12),
  );

  //
  static final kBottomLabelSelectedTextStyle = TextStyle(
    color: kPrimaryColor,
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w700,
  );

  static final String lightFontFamily = "Ubuntu-Light";

  static final String mediumFontFamily = "Ubuntu-Medium";

  static final Color loginCard = Colors.white.withOpacity(0.98);

  static final Color loadingColor = blueTheme;

  static final Color blueTheme = Color(0XFF317CFB);

  static final Color iconContainerColor = AppTheme.blueTheme.withOpacity(0.8);

  static final kPrimaryColor = Color(0XFF317CFB);

  static final kWhiteColor = Color(0XFFFFFFFF);

  static final kBlackColor = Color(0XFF000000);

  static final kDescriptionTextColor = Color(0XFF002434);

  static final kDotsColor = Color(0XFF212121);

  static final kGreyColor = Color(0XFF8F92A1);

  static final LinearGradient loginBackPainter = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.white.withOpacity(0.95), Colors.grey],
  );

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Ubuntu',
    brightness: Brightness.light,
    radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(kPrimaryColor)),
    appBarTheme: AppBarTheme(
      titleTextStyle: kHeadline1.copyWith(color: kBlackColor),
      backgroundColor: kWhiteColor,
      iconTheme: IconThemeData(
        size: ScreenUtil().setWidth(32),
        color: kBlackColor,
      ),
    ),
    scaffoldBackgroundColor: kWhiteColor,
    textSelectionHandleColor: Colors.grey[600],
    textSelectionColor: Colors.black,
    shadowColor: Colors.black12,
    splashColor: Colors.transparent,
    bottomAppBarColor: kWhiteColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      unselectedIconTheme: IconThemeData(),
      selectedLabelStyle: kBottomLabelSelectedTextStyle.copyWith(
          color: kPrimaryColor,
          fontWeight: FontWeight.w500,
          fontSize: ScreenUtil().setSp(10)),
      unselectedLabelStyle: kBottomLabelUnselectedTextStyle.copyWith(
          color: kPrimaryColor, fontSize: ScreenUtil().setSp(10)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kGreyColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: kGreyColor),
      ),
      labelStyle: kBodyTextStyle,
      hintStyle: kBodyTextStyle.copyWith(color: Colors.grey),
    ),
    textTheme: TextTheme(
      headline1: kHeadline1,
      headline2: kHeadline2,
      bodyText1: kBodyTextStyle,
      bodyText2: kBodyTextStyle.copyWith(fontSize: ScreenUtil().setSp(12)),
      button: kButtonTextStyle,
    ),
    cardColor: kWhiteColor,
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    focusColor: Colors.transparent,
    canvasColor: Colors.transparent,
    hoverColor: Colors.transparent,
    primaryColor: kPrimaryColor,
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xFF0B0D24),
      textSelectionHandleColor: Colors.white,
      textSelectionColor: Colors.grey[200],
      shadowColor: Colors.black12,
      splashColor: Colors.transparent,
      bottomAppBarColor: Color(0xFF24174D),
      cardColor: Color(0xFF24174D),
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      canvasColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      primaryColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
      ));
}
