import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_animation/logic/calculator/bloc/calculator_bloc.dart';
import 'package:theme_animation/ui/widgets/app_bar.dart';
import 'package:theme_animation/ui/widgets/portrait_or_landscape.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              leading: const AppBarWidget(),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            body: BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                if (state is CalculatorInitial) {
                  return  PortraitOrLandscape(
                      symbols: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? state.symbolsP
                          : state.symbolsL,
                      input: "0",
                      output: "0",
                      myBackgroundColor: state.myBackgroundColor,
                      myTextColor: state.myTextColor);
                } else if (state is CalculatorInProgressState) {
                  return  PortraitOrLandscape(
                      symbols: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? state.symbolsP
                          : state.symbolsL,
                      input: state.input,
                      output: state.output,
                      myBackgroundColor: state.myBackgroundColor,
                      myTextColor: state.myTextColor);
                }
                return const Center();
              },
            )));
  }
}
