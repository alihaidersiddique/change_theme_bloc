import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_mode_bloc/bloc/change_theme_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChanged = false;

  _lightTheme(context) =>
      BlocProvider.of<ChangeThemeBloc>(context).add(ChangeToLightThemeEvent());

  _darkTheme(context) =>
      BlocProvider.of<ChangeThemeBloc>(context).add(ChangeToDarkThemeEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isChanged = !isChanged;
                isChanged ? _darkTheme(context) : _lightTheme(context);
              });
            },
            icon: const Icon(Icons.brightness_4),
            tooltip: 'Theme Selector',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.done),
      ),
      body: const Center(
        child: FlutterLogo(size: 200),
      ),
    );
  }
}
