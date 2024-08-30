part of 'calculator_bloc.dart';

sealed class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class CalculatorInitEvent extends CalculatorEvent {
  const CalculatorInitEvent();
}



class CalculatorNumberEvent extends CalculatorEvent {
  final int number;
  final BuildContext context;
  const CalculatorNumberEvent({required this.number, required this.context});
  @override
  List<Object> get props => [number];
}

class CalculatorOperatorEvent extends CalculatorEvent {
  final String operator;
  final BuildContext context;
  const CalculatorOperatorEvent(
      {required this.operator, required this.context});

  @override
  List<Object> get props => [operator];
}

class CalculatorDeleteLastNumberEvent extends CalculatorEvent {
  final BuildContext context;
  const CalculatorDeleteLastNumberEvent({required this.context});
}

class CalculatorClearEvent extends CalculatorEvent {
  final BuildContext context;
  const CalculatorClearEvent({required this.context});
}

class CalculatorResultEvent extends CalculatorEvent {
  final double result;
  final BuildContext context;
  const CalculatorResultEvent({required this.result, required this.context});
  @override
  List<Object> get props => [result];
}

class CalculatorEnterDataEvent extends CalculatorEvent {
  final String x;
  final BuildContext context;

  const CalculatorEnterDataEvent({
    required this.x,
    required this.context,
  });
  void setData() {
    if (x == "C") {
      // BlocProvider.of<ThemeBloc>(context)
      //     .add(ThemeChangeEvent(theme: AppTheme.blueLight));
    }
    if ((x) == "0" ||
        (x) == "1" ||
        (x) == "2" ||
        (x) == "3" ||
        (x) == "4" ||
        (x) == "5" ||
        (x) == "6" ||
        (x) == "7" ||
        ((x) == "8" || ((x) == "9"))) {
      BlocProvider.of<CalculatorBloc>(context)
          .add(CalculatorNumberEvent(number: int.parse(x), context: context));
    } else if (x == "=" || x == "A") {
      BlocProvider.of<CalculatorBloc>(context)
          .add(CalculatorResultEvent(result: 0, context: context));
    } else if (x == "D") {
      // ignore: prefer_const_constructors
      BlocProvider.of<CalculatorBloc>(context)
          .add(CalculatorClearEvent(context: context));
    } else if (x == "C") {
      BlocProvider.of<CalculatorBloc>(context)
          .add(CalculatorDeleteLastNumberEvent(context: context));
    } else {
      BlocProvider.of<CalculatorBloc>(context)
          .add(CalculatorOperatorEvent(operator: x, context: context));
    }
  }

  @override
  List<Object> get props => [x];
}

