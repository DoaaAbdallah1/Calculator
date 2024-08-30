// ignore_for_file: must_be_immutable

part of 'calculator_bloc.dart';

sealed class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

final class CalculatorInitial extends CalculatorState {

  List<String> symbols = [
    'C',
    '*/-',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'D',
    '=',
  ];
  Color myBackgroundColor(String x,BuildContext context) {

    if (x == '/' || x == '+' || x == '*' || x == '-' || x == '=') {
      return ThemeModelInheritedNotifier.of(context).theme.brightness ==Brightness.light ? buttonLightHigh : buttonDarkHigh;
    } else if (x == '%' || x == '*/-' || x == 'C') {
      return ThemeModelInheritedNotifier.of(context).theme.brightness ==Brightness.light
          ? buttonLightMedium
          : buttonDarkMedium;
    } else {
      return ThemeModelInheritedNotifier.of(context).theme.brightness ==Brightness.light? buttonLightLow : buttonDarkLow;
    }
  }

  Color myTextColor(String x,BuildContext context) {

    if (
        x == '/' ||
        x == '+' ||
        x == '*' ||
        x == '-' ||
        x == '=') {
      return Colors.white;
    } else {
      return ThemeModelInheritedNotifier.of(context).theme.brightness ==Brightness.light ? Colors.black : Colors.white;
    }
  }


}

class CalculatorInProgressState extends CalculatorState {
  final String input;
  final String output;

  List<String> symbols = [
    'C',
    '*/-',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'D',
    '=',
  ];


  CalculatorInProgressState(
      {required this.output, required this.input});

  Color myBackgroundColor(String x,BuildContext context) {
     
    if (x == '/' || x == '+' || x == '*' || x == '-' || x == '=') {
      return ThemeModelInheritedNotifier.of(context).theme.brightness ==Brightness.light ? buttonLightHigh : buttonDarkHigh;
    } else if (x == '%' || x == '*/-' || x == 'C') {
      return ThemeModelInheritedNotifier.of(context).theme.brightness ==Brightness.light
          ? buttonLightMedium
          : buttonDarkMedium;
    } else {
      return ThemeModelInheritedNotifier.of(context).theme.brightness ==Brightness.light? buttonLightLow : buttonDarkLow;
    }
  }

  Color myTextColor(String x,BuildContext context) {

    if (
        x == '/' ||
        x == '+' ||
        x == '*' ||
        x == '-' ||
        x == '=') {
      return Colors.white;
    } else {
      return ThemeModelInheritedNotifier.of(context).theme.brightness ==Brightness.light ? Colors.black : Colors.white;
    }
  }

  @override
  List<Object> get props => [input, output];
}
