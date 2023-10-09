part of 'change_theme_bloc.dart';

class CustomMaterialColor {
  final int r;
  final int g;
  final int b;

  CustomMaterialColor(this.r, this.g, this.b);

  MaterialColor get mdColor {
    Map<int, Color> color = {
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    };
    return MaterialColor(Color.fromRGBO(r, g, b, 1).value, color);
  }
}

@immutable
sealed class ChangeThemeEvent {
  ThemeData getTheme();
  String getName();
}

class ChangeToDarkThemeEvent extends ChangeThemeEvent {
  final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.grey,
      onPrimary: Colors.black,
      secondary: Colors.grey,
      onSecondary: Colors.black,
      error: Colors.grey,
      onError: Colors.black,
      background: Colors.grey,
      onBackground: Colors.black,
      surface: CustomMaterialColor(72, 220, 182).mdColor,
      onSurface: Colors.black,
    ),
  );

  @override
  ThemeData getTheme() => darkTheme;

  @override
  String getName() => 'dark';
}

class ChangeToLightThemeEvent extends ChangeThemeEvent {
  final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFE6E3AC),
      onPrimary: Colors.black,
      secondary: Color(0xFFE6E3AC),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      background: Colors.indigo,
      onBackground: Colors.black,
      surface: Colors.indigo,
      onSurface: Colors.black,
    ),
  );

  @override
  ThemeData getTheme() => lightTheme;

  @override
  String getName() => 'light';
}
