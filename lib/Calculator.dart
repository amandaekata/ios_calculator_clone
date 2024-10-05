import 'package:calculator_project/CalcModel.dart';
import 'package:calculator_project/CalculatorWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
   List<String> actionList = ['+', '/', 'x', '-'];
  //List<String> numberList = ['7', '8', '9', '4', '5', '6', '1', '2', '3', '0'];

  List<CalcModel> calcList = [
    CalcModel(
        texts: 'C',
        color: const Color.fromARGB(255, 202, 201, 201),
        textcolor: Colors.black,
        Flex: 1),
    CalcModel(
        texts: '+/-',
       color: const Color.fromARGB(255, 202, 201, 201),
        textcolor: Colors.black,
        Flex: 1),
    CalcModel(
        texts: '%',
        color: const Color.fromARGB(255, 202, 201, 201),
        textcolor: Colors.black,
        Flex: 1),
    CalcModel(
        texts: '/', 
        color: Colors.orange, 
        textcolor: Colors.white, Flex: 1),
    CalcModel(
        texts: '7',
       color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 1),
    CalcModel(
        texts: '8',
       color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 1),
    CalcModel(
        texts: '9',
        color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 1),
    CalcModel(
        texts: 'x', 
        color: Colors.orange, 
        textcolor: Colors.white, Flex: 1),
    CalcModel(
        texts: '4',
        color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 1),
    CalcModel(
        texts: '5',
        color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 1),
    CalcModel(
        texts: '6',
        color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 1),
    CalcModel(
        texts: '-', 
       color: Colors.orange,
         textcolor: Colors.white, Flex: 1),
    CalcModel(
        texts: '1',
       color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 1),
    CalcModel(
        texts: '2',
        color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 1),
    CalcModel(
        texts: '3',
        color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 1),
    CalcModel(
        texts: '+', 
       color: Colors.orange, 
        textcolor: Colors.white, Flex: 1),
    CalcModel(
        texts: '0',
        color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 2),
    CalcModel(
        texts: '.',
        color: const Color.fromARGB(255, 63, 63, 62),
        textcolor: Colors.white,
        Flex: 1),
    CalcModel(
        texts: '=',
        color: Colors.orange, 
         textcolor: Colors.white, Flex: 1),
  ];
  String zero = 0.toString();
  double num1 = 0;
  double num2 = 0;
  String action = '';

  int selectedItem= 0;
  final bool istapped= false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 70,),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    zero.toString(),
                    style: const TextStyle(fontSize: 70, color: Colors.white),
                  ),
                ],
              ),
             
              Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 1),
                    itemCount: calcList.length,
                    itemBuilder: (context, index) {
                      // final isZeroButton = calcList[index].texts=='0';
                      return CalculatorWidget(
                        calcList: calcList[index],
                        istapped: index== selectedItem,
                        onpressed: () {
                          setState(() {
                           selectedItem= index;
                            if (calcList[index].texts == 'C') {
                              action = '';
                              zero = '0';
                              num1 = 0;
                              num2 = 0;
                            } else if (calcList[index].texts == '+/-') {
                              zero = (double.parse(zero) * -1).toString();
                            } else if (calcList[index].texts == '=') {
                              num2 = double.parse(zero);
                              switch (action) {
                                case '+':
                                  zero = (num1 + num2).toString();
                                
                                  break;

                                case '-':
                                  zero = (num1 - num2).toString();
                                  break;
                                case 'x':
                                  zero = (num1 * num2).toString();
                                  break;
                                  case '%':
                                  zero = (num1 / 100).toString();
                                  break;
                                case '/':
                                  if (num2 != 0) {
                                    zero = (num1 / num2).toString();
                                  } else {
                                    zero = 'Error';
                                   
                                  }
                                  break;
                                 
                              }
                              num1 = double.parse(zero);
                              action = '';
                            } else if (['+', '-', 'x','%' ,'/', ]
                                .contains(calcList[index].texts)) {
                              if(action== calcList[index].texts && num1!=0) {
                               // zero= (double.parse(zero)+ num1).toString();
                              }
                              else{
                              
                              action = calcList[index].texts;
                              num1 = double.parse(zero);}

                              // action = '';
                            } else {
                              if (zero == '0') {
                                zero = calcList[index].texts;

                                //
                              } else {
                                if (num1.toString() == zero) {
                                  zero = calcList[index].texts;
                                
                                } else {
                                  zero = zero + calcList[index].texts;
                                }
                              }
      
                            }
                            
                           

                            // if (zero.isEmpty) {
                            //   calcList[0].texts = 'Ac';
                            //   zero = 0.toString();
                            // } else {
                            //   calcList[0].texts = 'C';
                            // }
                          });
                        },
                      );
                    }
                    
                    ),
              )
            ],
          ),
        ));
  }
}
