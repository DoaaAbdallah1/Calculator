import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_animation/logic/calculator/bloc/calculator_bloc.dart';
import 'package:theme_animation/ui/widgets/app_bar.dart';
import 'package:theme_animation/ui/widgets/calculator_part.dart';

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
            appBar: AppBar(leading: const AppBarWidget(),backgroundColor:  Theme.of(context).scaffoldBackgroundColor,),
            body: BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                if (state is CalculatorInitial) {
                  return CalculatorPart(symbols:state.symbols,input:"0",output:"0",myBackgroundColor:state.myBackgroundColor,myTextColor:state.myTextColor);
                } else if (state is CalculatorInProgressState) {
                  return  CalculatorPart(symbols:state.symbols,input:state.input,output:state.output,myBackgroundColor:state.myBackgroundColor,myTextColor:state.myTextColor);
                  
                }
                return const Center();
              },
            )
            
            ));
  }
}
