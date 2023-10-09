import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'change_theme_event.dart';
part 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  ChangeThemeBloc()
      : super(
          ChangeThemeState(
            "initial",
            ThemeData(
              colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Colors.indigo,
                onPrimary: Colors.black,
                secondary: Colors.indigo,
                onSecondary: Colors.black,
                error: Colors.red,
                onError: Colors.black,
                background: Colors.yellow,
                onBackground: Colors.black,
                surface: Colors.yellow,
                onSurface: Colors.black,
              ),
            ),
          ),
        ) {
    on<ChangeToDarkThemeEvent>(
      (event, emit) => emit(
        ChangeThemeState(
          event.getName(),
          event.getTheme(),
        ),
      ),
    );
    on<ChangeToLightThemeEvent>(
      (event, emit) => emit(
        ChangeThemeState(
          event.getName(),
          event.getTheme(),
        ),
      ),
    );
  }
}
