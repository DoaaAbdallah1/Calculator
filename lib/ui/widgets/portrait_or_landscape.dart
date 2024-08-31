import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_animation/ui/resposive/landscape.dart';
import 'package:theme_animation/ui/resposive/portrait.dart';

class  PortraitOrLandscape extends StatelessWidget {
  final List<String> symbols;
  final String input;
  final String output;

  final Color Function(String x, BuildContext context)
      myBackgroundColor;
  final Function(String x, BuildContext context) myTextColor;

  const  PortraitOrLandscape(
      {super.key,
      required this.symbols,
      required this.input,
      required this.output,
      required this.myBackgroundColor,
      required this.myTextColor});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Portrait(
            symbols: symbols,
            input: input,
            output: output,
            myBackgroundColor: myBackgroundColor,
            myTextColor: myTextColor)
        : Landscape(
            symbols: symbols,
            input: input,
            output: output,
            myBackgroundColor: myBackgroundColor,
            myTextColor: myTextColor);
  }
}
