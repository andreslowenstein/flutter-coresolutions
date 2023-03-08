import 'package:coresolutions/helpers/transitions/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// http://mcg.mbitson.com Color swatch generator
//Pallete: https://coolors.co/db5461-686963-8aa29e-3d5467-f1edee

Map<int, Color> primarySwatch = {
  0: const Color(0xff000000),
  10: const Color(0xff001F29),
  20: const Color(0xff003545),
  30: const Color(0xff004D63),
  40: const Color(0xff006783),
  50: const Color(0xff0081A4),
  60: const Color(0xff009DC6),
  70: const Color(0xff3EB8E2),
  80: const Color(0xff61D4FF),
  90: const Color(0xffBCE9FF),
  95: const Color(0xffDFF4FF),
  99: const Color(0xffFAFCFF),
  100: const Color(0xffFFFFFF)
};

Map<int, Color> secondarySwatch = {
  0: const Color(0xff000000),
  10: const Color(0xff081E27),
  20: const Color(0xff1E333C),
  30: const Color(0xff354A53),
  40: const Color(0xff4C616B),
  50: const Color(0xff657A85),
  60: const Color(0xff7E949F),
  70: const Color(0xff99AFBA),
  80: const Color(0xffB4CAD5),
  90: const Color(0xffCFE6F2),
  95: const Color(0xffDFF4FF),
  99: const Color(0xffFAFCFF),
  100: const Color(0xffFFFFFF)
};
Map<int, Color> tertiarySwatch = {
  0: const Color(0xff000000),
  10: const Color(0xff331200),
  20: const Color(0xff542200),
  30: const Color(0xff773300),
  40: const Color(0xff974811),
  50: const Color(0xffB66029),
  60: const Color(0xffD6783F),
  70: const Color(0xffF69257),
  80: const Color(0xffFFB68E),
  90: const Color(0xffFFDBCA),
  95: const Color(0xffFFEDE5),
  99: const Color(0xffFFFBFF),
  100: const Color(0xffFFFFFF)
};

Map<int, Color> errorSwatch = {
  0: const Color(0xff000000),
  10: const Color(0xff410002),
  20: const Color(0xff690005),
  30: const Color(0xff93000A),
  40: const Color(0xffBA1A1A),
  50: const Color(0xffDE3730),
  60: const Color(0xffFF5449),
  70: const Color(0xffFF897D),
  80: const Color(0xffFFB4AB),
  90: const Color(0xffFFDAD6),
  95: const Color(0xffFFEDEA),
  99: const Color(0xffFFFBFF),
  100: const Color(0xffFFFFFF)
};

Map<int, Color> neutralSwatch = {
  0: const Color(0xff000000),
  10: const Color(0xff191C1E),
  20: const Color(0xff2E3132),
  30: const Color(0xff444749),
  40: const Color(0xff5C5F60),
  50: const Color(0xff757779),
  60: const Color(0xff8F9193),
  70: const Color(0xffA9ABAD),
  80: const Color(0xffC5C7C8),
  90: const Color(0xffE1E2E4),
  95: const Color(0xffEFF1F3),
  99: const Color(0xffFAFCFF),
  100: const Color(0xffFFFFFF)
};

Map<int, Color> neutralVariantSwatch = {
  0: const Color(0xff000000),
  10: const Color(0xff151D20),
  20: const Color(0xff2A3235),
  30: const Color(0xff40484C),
  40: const Color(0xff586064),
  50: const Color(0xff70787D),
  60: const Color(0xff8A9296),
  70: const Color(0xffA4ACB1),
  80: const Color(0xffC0C8CC),
  90: const Color(0xffDCE4E9),
  95: const Color(0xffEAF2F7),
  99: const Color(0xffFAFCFF),
  100: const Color(0xffFFFFFF)
};

var primaryColor = MaterialColor(primarySwatch[40]!.value, primarySwatch);

var secondaryColor = MaterialColor(secondarySwatch[40]!.value, secondarySwatch);

var tertiaryColor = MaterialColor(tertiaryColor[40]!.value, tertiarySwatch);

var errorColor = MaterialColor(errorSwatch[40]!.value, errorSwatch);

Color bodyBackground = const Color(0xffF1EDEE);
Color black = const Color(0xff2f2f2f);

final ThemeData lightColorScheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006783),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFBDE9FF),
    onPrimaryContainer: Color(0xFF001F2A),
    secondary: Color(0xFF4D616C),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD0E6F2),
    onSecondaryContainer: Color(0xFF081E27),
    tertiary: Color(0xFF5D5B7D),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE3DFFF),
    onTertiaryContainer: Color(0xFF191836),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFCFE),
    onBackground: Color(0xFF191C1E),
    surface: Color(0xFFFBFCFE),
    onSurface: Color(0xFF191C1E),
    surfaceVariant: Color(0xFFDCE4E9),
    onSurfaceVariant: Color(0xFF40484C),
    outline: Color(0xFF70787D),
    onInverseSurface: Color(0xFFEFF1F3),
    inverseSurface: Color(0xFF2E3132),
    inversePrimary: Color(0xFF64D3FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006783),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    color: primaryColor,
    titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 17.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600),
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(height: 64 / 57, fontSize: 57),
    displayMedium: TextStyle(height: 52 / 45, fontSize: 45),
    displaySmall: TextStyle(height: 44 / 36, fontSize: 36),
    headlineLarge: TextStyle(height: 40 / 32, fontSize: 32),
    headlineMedium:
        TextStyle(height: 36 / 28, fontSize: 28, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(height: 32 / 24, fontSize: 24),
    titleLarge: TextStyle(
      height: 28 / 22,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      height: 24 / 16,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
        height: 20 / 14,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyLarge: TextStyle(height: 24 / 16, fontSize: 16, letterSpacing: 0.5),
    bodyMedium: TextStyle(height: 20 / 14, fontSize: 14, letterSpacing: 0.25),
    bodySmall: TextStyle(height: 16 / 12, fontSize: 12, letterSpacing: 0.4),
    labelLarge: TextStyle(height: 20 / 14, fontSize: 14, letterSpacing: 0.1),
    labelMedium: TextStyle(height: 16 / 12, fontSize: 12, letterSpacing: 0.5),
    labelSmall: TextStyle(height: 16 / 11, fontSize: 11, letterSpacing: 0.4),
  ),
  listTileTheme: const ListTileThemeData(
    minLeadingWidth: 20,
  ),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: FadePageTransitionBuilder(),
    TargetPlatform.iOS: FadePageTransitionBuilder()
  }),
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    labelStyle: const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: 0.1,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: black,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: primaryColor,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: errorColor,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: errorColor,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1.5,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
  ),
  cardTheme: const CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    ),
  ),
);
