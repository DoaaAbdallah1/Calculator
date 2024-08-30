import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_animation/logic/calculator/bloc/calculator_bloc.dart';
import 'package:theme_animation/ui/home.dart';
import 'package:theme_animation/ui/loadingPage.dart';
import 'package:theme_animation/logic/theme/bloc/app_theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                title: 'Flutter Animated Theme',
                debugShowCheckedModeBanner: false,
                theme: state.theme,
                home: const HomeView(),
              ),
            );
          }
          return const MaterialApp(
            debugShowCheckedModeBanner: false,

            home: MyWidget(),
          );
        },
      ),
    );
  }
}
