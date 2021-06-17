import 'package:curanetwork_library/imports/imports.dart';

/*This class have all colors that are used in the application.
  For example if i needed to access the "primaryColor" I would 
  use "Theme.of(context).primaryColor"*/
class AppTheme {
  AppTheme._();

  static final String lightFontFamily = "Ubuntu-Light";
  static final String mediumFontFamily = "Ubuntu-Medium";
  static final Color loginCard = Colors.white.withOpacity(0.98);
  static final Color loadingColor = blueTheme;
  static final Color blueTheme = Color(0xFFF00606);
  static final Color orangeTheme = Color(0xFFFDAE47);
//  static final Color darkblueTheme = Color(0xFF434952);
  static final Color darkblueTheme = Color(0xFFF00606);
  static final Color iconContainerColor = AppTheme.blueTheme.withOpacity(0.8);

  static final Shader loginSelectedPainter = RadialGradient(
    colors: [
      Color(0xFF434952),
      Color(0xFF434952),
    ],
  ).createShader(Rect.fromCircle(
    center: Offset(5, 5),
    radius: 6,
  ));

  static final LinearGradient loginBackPainter = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.white.withOpacity(0.95), Colors.grey],
  );

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.grey[50],
      textSelectionHandleColor: Colors.grey[600],
      textSelectionColor: Colors.black,
      shadowColor: Colors.black12,
      splashColor: Colors.transparent,
      bottomAppBarColor: Colors.white,
      cardColor: Colors.white,
      highlightColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      focusColor: Colors.transparent,
      canvasColor: Colors.transparent,
      hoverColor: Colors.transparent,
      primaryColor: blueTheme,
      iconTheme: IconThemeData(
        color: Colors.grey,
      ));

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
