// ignore_for_file: use_build_context_synchronously

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:theme_animation/logic/theme/app_theme.dart';
import 'package:theme_animation/logic/theme/theme_cache_helper.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  var darkTheme = Themes.darkTheme;
  var lightTheme = Themes.lightTheme;
  AppThemeBloc() : super(AppThemeInitial()) {
    on<AppThemeEvent>((event, emit) async {

      if(event is ThemeCurrentEvent){
        int themeIndex=  await ThemeCacheHelper().getCachedThemeIndex();
      //  ThemeSwitcher.of(event.context).changeTheme(theme: themeIndex == 0? darkTheme : lightTheme, isReversed: themeIndex == 0);
        emit(AppThemeChange(theme: themeIndex == 0? darkTheme : lightTheme));
      }

      if (event is ThemeColorChangeEvent) {
        var brightness =
            ThemeModelInheritedNotifier.of(event.context).theme.brightness;
        ThemeSwitcher.of(event.context).changeTheme(
          theme: brightness == Brightness.light ? darkTheme : lightTheme,
          isReversed: brightness == Brightness.light ? true : false,
        );
        int themeIndex = brightness == Brightness.light ? 0 : 1;
        await ThemeCacheHelper().cacheThemeIndex(themeIndex);


        emit(AppThemeChange(theme: brightness == Brightness.light? darkTheme : lightTheme));
      }
    });
  }
}
