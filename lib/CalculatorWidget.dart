import 'package:calculator_project/CalcModel.dart';
import 'package:flutter/material.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key, required this.calcList, required this.istapped, required this.onpressed});
 final  CalcModel calcList;
 final bool istapped;
 final Function() onpressed;


  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpressed,
      
   
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container( height: 10, width: widget.calcList.texts== '0'? 30 : 10,
          decoration: BoxDecoration(color: widget.istapped? Colors.white : widget.calcList.color ,
           borderRadius: BorderRadius.circular(80)),
          child: Center(child: Text(widget.calcList.texts, style: TextStyle(color:  widget.istapped? Colors.orange : widget.calcList.textcolor , fontSize: 40),)),
          
            
          ),
      ),
    );
  
  }
}