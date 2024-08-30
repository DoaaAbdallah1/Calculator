import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_animation/logic/calculator/bloc/calculator_bloc.dart';

class CalculatorPart extends StatelessWidget {
  final List<String> symbols;
  final String input;
  final String output;
  final Color Function(String x,BuildContext context) myBackgroundColor;
  final Function(String x,BuildContext context) myTextColor;

  const CalculatorPart(
      {super.key,
      required this.symbols,
      required this.input,
      required this.output,
      required this.myBackgroundColor,
      required this.myTextColor});

  @override
  Widget build(BuildContext context) {
    double heightScreen =  MediaQuery.of(context).size.height;
    double widthScreen  = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
    //  height: MediaQuery.of(context).size.height*0.90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top:heightScreen*0.025,bottom: heightScreen*0.025,left: widthScreen*0.025,right: widthScreen*0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          input,
                          style:  TextStyle(
                              fontSize: heightScreen*0.04, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                
                  Text(
                    output,
                    style:  TextStyle(
                        fontSize: heightScreen*0.08, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              //height: heightScreen*0.58,
              padding:  EdgeInsets.only(right:widthScreen*0.025 , left: widthScreen*0.025, top: heightScreen*0.025,bottom:  heightScreen*0.005 ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: symbols.length,
                gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent:widthScreen>=583?widthScreen*0.13: widthScreen*0.30,
                  childAspectRatio:1,
                  
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                    
                      BlocProvider.of<CalculatorBloc>(context).add(
                          CalculatorEnterDataEvent(
                              x: symbols[index], context: context));
                    },
                    child: Container(
                    
                    margin:  EdgeInsets.only(right:widthScreen*0.015 , left: widthScreen*0.015, bottom: heightScreen*0.015),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: myBackgroundColor(
                          symbols[index],
                        context
                        ),
                      ),
                      child:index==symbols.length-2?Icon(CupertinoIcons.delete_left,size: 30,): Center(
                          child: Text(
                        symbols[index],
                        style: TextStyle(
                            color: myTextColor(symbols[index],context),
                            fontSize: heightScreen*0.04,
                            fontWeight: FontWeight.w300),
                      )),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
