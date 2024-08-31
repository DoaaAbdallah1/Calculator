import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_animation/logic/calculator/bloc/calculator_bloc.dart';

class Portrait extends StatelessWidget {
  final List<String> symbols;
  final String input;
  final String output;
  final Color Function(String x, BuildContext context ) myBackgroundColor;
  final Function(String x, BuildContext context ) myTextColor;

  const Portrait(
      {super.key,
      required this.symbols,
      required this.input,
      required this.output,
      required this.myBackgroundColor,
      required this.myTextColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double heightScreen = constraints.maxHeight;
        double widthScreen = constraints.maxWidth;

        return SizedBox(
          width: widthScreen,
          height: heightScreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: heightScreen * 0.35,
                padding: EdgeInsets.only(
                    top: heightScreen * 0.05,
                    bottom: heightScreen * 0.025,
                    left: widthScreen * 0.025,
                    right: widthScreen * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            input,
                            style: TextStyle(
                                fontSize:  heightScreen *0.275*(2/8),
                                fontWeight: FontWeight.w300),
                                 textScaleFactor: 1.0, 
                          ),
                        ],
                      ),
                    ),
                    Text(
                      output,
                      style: TextStyle(
                          fontSize: heightScreen *0.275*(3/8),
                          fontWeight: FontWeight.w300),
                           textScaleFactor: 1.0, 
                    ),
                  ],
                ),
              ),
              Container(
                height: heightScreen * 0.65,
                padding: EdgeInsets.only(
                    right: widthScreen * 0.025,
                    left: widthScreen * 0.025,
                    top: heightScreen * 0.025,
                    bottom: heightScreen * 0.005),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: symbols.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: heightScreen * 0.60 * (1/5),
                      crossAxisCount: 4,
                      childAspectRatio: 20 / 13
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        BlocProvider.of<CalculatorBloc>(context).add(
                            CalculatorEnterDataEvent(
                                x: symbols[index], context: context));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: widthScreen * 0.015,
                            left: widthScreen * 0.015,
                            bottom: widthScreen * 0.015,
                            top: widthScreen * 0.015),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: myBackgroundColor(symbols[index], context),
                        ),
                        child: index == symbols.length - 2
                            ?  Icon(
                                CupertinoIcons.delete_left,
                                
                                size:  heightScreen * 0.60 * (1/5)*(1/3.2),
                              )
                            : Center(
                                child: Text(
                                symbols[index],
                                textScaleFactor: 1.0, 
                                style: TextStyle(
                                    color: myTextColor(symbols[index], context),
                                    fontSize: heightScreen * 0.60 * (1/5)*(1/3.2),
                                    fontWeight: FontWeight.w300),
                              )),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
