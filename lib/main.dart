import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_animation/logic/calculator/bloc/calculator_bloc.dart';
import 'package:theme_animation/ui/home.dart';
import 'package:theme_animation/ui/loadingPage.dart';
import 'package:theme_animation/logic/theme/bloc/app_theme_bloc.dart';

void main() {
  runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);
}

class MyApp extends StatelessWidget {
  const MyApp( {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeBloc>(
          create: (context) =>  AppThemeBloc()..add(ThemeCurrentEvent(context: context)),
        ),
        BlocProvider<CalculatorBloc>(
          create: (context) => CalculatorBloc(),
        ),
        
      ],
  
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state) {
          if (state is AppThemeChange) {
            return ThemeProvider(
              initTheme: state.theme,
              builder: (p0, theme) => MaterialApp(
                 useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
                title: 'Flutter Animated Theme',
                debugShowCheckedModeBanner: false,
                theme: state.theme,
                home: const HomeView(),
              ),
            );
          }
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
             useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

            home: MyWidget(),
          );
        },
      ),
    );
  }
}
