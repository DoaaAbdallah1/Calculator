import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:theme_animation/constants/colors.dart';
part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  String input = "";
  String output = "0";
  CalculatorBloc() : super(CalculatorInitial()) {
    on<CalculatorEvent>((event, emit) {
      if (input == "0") {
        input = "";
      }
      
      if (event is CalculatorNumberEvent) {
        input = input.isEmpty
            ? event.number.toString()
            : input + event.number.toString();

        Expression exp = Parser().parse(input);
        double result = exp.evaluate(EvaluationType.REAL, ContextModel());
        output = result.toStringAsFixed(1);
        emit(CalculatorInProgressState(
            input: input,
            output: output));
      }
      if (event is CalculatorEnterDataEvent) {
        event.setData();
      }
      if (event is CalculatorOperatorEvent) {
        if (input.endsWith('/') ||
            input.endsWith('*') ||
            input.endsWith('+') ||
            input.endsWith('-') ||
            input.endsWith('%')) {
          input = input;
          emit(CalculatorInProgressState(
              input: input,
              output: output));
        } else {
          input = input.isEmpty ? "" : input + event.operator;
          emit(CalculatorInProgressState(
              input: input,
              output: output));
        }

        emit(CalculatorInProgressState(
            input: input,
            output: output));
      }
      if (event is CalculatorClearEvent) {
        input = "0";
        output = "0";

        emit(CalculatorInProgressState(
            input: input,
            output: output));
      }
      if (event is CalculatorResultEvent) {
        input = output;
        output = "";

        emit(CalculatorInProgressState(
            input: input,
            output: output));
      }
      if (event is CalculatorDeleteLastNumberEvent) {
        input = input.length > 1 ? input.substring(0, input.length - 1) : "0";
        String outputTest = "";
        if (input[input.length - 1] == '0' ||
            input[input.length - 1] == '1' ||
            input[input.length - 1] == '2' ||
            input[input.length - 1] == '3' ||
            input[input.length - 1] == '4' ||
            input[input.length - 1] == '5' ||
            input[input.length - 1] == '6' ||
            input[input.length - 1] == '7' ||
            input[input.length - 1] == '8' ||
            input[input.length - 1] == '9') {
          outputTest = input;
        } else {
          outputTest = "";
        }
        output = input.isEmpty ? "0" : outputTest;
        emit(CalculatorInProgressState(
            input: input,
            output: output));
      }
    });
  }
}
