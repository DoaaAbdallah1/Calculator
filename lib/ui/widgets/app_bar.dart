import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_animation/logic/theme/bloc/app_theme_bloc.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      clipper:const ThemeSwitcherCircleClipper(),
      builder: (context) {
        return IconButton(
          icon: Icon(
            ThemeModelInheritedNotifier.of(context).theme.brightness ==Brightness.light
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
          onPressed: () {
            BlocProvider.of<AppThemeBloc>(context)
                .add(ThemeColorChangeEvent(context: context));
          },
        );
      },
    );
  }
}
