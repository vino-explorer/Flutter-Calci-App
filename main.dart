import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String inputvalue = "";
  String calculatedValue = "";
  String operator = "";
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              inputvalue,
              style: const TextStyle(color: Colors.white, fontSize: 100),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  calcButton("7", Colors.white38),
                  calcButton("8", Colors.white38),
                  calcButton("9", Colors.white38),
                  calcButton("/", Colors.orange),
                ],
              ),
              Row(
                children: [
                  calcButton("4", Colors.white38),
                  calcButton("5", Colors.white38),
                  calcButton("6", Colors.white38),
                  calcButton("*", Colors.orange),
                ],
              ),
              Row(
                children: [
                  calcButton("1", Colors.white38),
                  calcButton("2", Colors.white38),
                  calcButton("3", Colors.white38),
                  calcButton("-", Colors.orange),
                ],
              ),
              Row(
                children: [
                  calcButton("0", Colors.white38),
                  calcButton(".", Colors.white38),
                  calcButton("=", Colors.orange),
                  calcButton("+", Colors.orange),
                ],
              ),
            ],
          ),
          calcButton("clear", Colors.white38)
        ],
      ),
    ));
  }

  Widget calcButton(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text == "clear") {
          setState(() {
            inputvalue = "";
            calculatedValue = "";
            operator = "";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            calculatedValue = inputvalue;
            inputvalue = "";
            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            double calc = double.parse(calculatedValue);
            double input = double.parse(inputvalue);
            switch (operator) {
              case "+":
                inputvalue = (calc + input).toString();
                break;
              case "-":
                inputvalue = (calc - input).toString();
                break;
              case "*":
                inputvalue = (calc * input).toString();
                break;
              case "/":
                inputvalue = (input != 0) ? (calc / input).toString() : "Error";
                break;
            }
          });
        } else {
          setState(() {
            inputvalue = inputvalue + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: bgcolor, borderRadius: BorderRadius.circular(100)),
        margin: const EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
