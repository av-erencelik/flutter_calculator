// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String firstParam = "";
  String operator = "";
  String secondParam = "";
  void handleOperation() {
    if (firstParam.isEmpty || operator.isEmpty || secondParam.isEmpty) {
      return;
    }
    if (secondParam.contains("%")) {
      secondParam =
          (double.parse(secondParam.substring(0, secondParam.length - 1)) / 100)
              .toString();
    }
    if (firstParam.contains("%") && (operator == "+" || operator == "-")) {
      firstParam = (double.parse(secondParam) /
              100 *
              double.parse(firstParam.substring(0, firstParam.length - 1)))
          .toString();
    } else if (firstParam.contains("%") &&
        (operator == "/" || operator == "x")) {
      firstParam =
          (double.parse(firstParam.substring(0, firstParam.length - 1)) / 100)
              .toString();
    }
    if (firstParam.contains("-")) {
      firstParam = firstParam.substring(1, firstParam.length - 1);
    } else if (secondParam.contains("-")) {
      secondParam = secondParam.substring(1, secondParam.length - 1);
    }
    RegExp regex = RegExp(r"([.]*0+)(?!.*\d)");
    if (operator == "+") {
      setState(() {
        secondParam = (double.parse(firstParam) + double.parse(secondParam))
            .toStringAsFixed(3)
            .replaceAll(regex, "");
        ;
        firstParam = "";
      });
    } else if (operator == "-") {
      setState(() {
        secondParam = (double.parse(secondParam) - double.parse(firstParam))
            .toStringAsFixed(3)
            .replaceAll(regex, "");
        ;
        firstParam = "";
      });
    } else if (operator == "x") {
      setState(() {
        secondParam = (double.parse(secondParam) * double.parse(firstParam))
            .toStringAsFixed(3)
            .replaceAll(regex, "");
        ;
        firstParam = "";
      });
    } else if (operator == "/") {
      if (firstParam == "0") return;
      setState(() {
        secondParam = (double.parse(secondParam) / double.parse(firstParam))
            .toStringAsFixed(3)
            .replaceAll(regex, "");
        ;
        firstParam = "";
      });
    }
  }

  void changeState(String key) {
    if (firstParam.isNotEmpty) {
      if (firstParam == "0" && key != ".") {
        setState(() {
          firstParam = key;
        });
        return;
      }
      ;
      if (firstParam.contains(".") && key == ".") return;
    }

    setState(() {
      firstParam = "$firstParam$key";
    });
  }

  void deleteLastInput(String operation) {
    if (firstParam.isNotEmpty) {
      setState(() {
        firstParam = firstParam.substring(0, firstParam.length - 1);
      });
    }
  }

  void handleOperatorOnPress(String operation) {
    if (firstParam.isNotEmpty && secondParam.isEmpty) {
      if (firstParam.contains("-")) firstParam = "$firstParam)";
      setState(() {
        operator = operation;
        secondParam = firstParam;
        firstParam = "";
      });
    } else if (firstParam.isNotEmpty && secondParam.isNotEmpty) {
      handleOperation();
      if (operation == "=") {
        setState(() {
          firstParam = secondParam;
          secondParam = "";
          operator = "";
        });
        return;
      }
      operator = operation;
    }
  }

  void clearAll(String operation) {
    setState(() {
      firstParam = "";
      secondParam = "";
      operator = "";
    });
  }

  void addPercantage(String operation) {
    if (firstParam.contains("%") || firstParam.isEmpty) {
      return;
    }
    setState(() {
      firstParam = "$firstParam%";
    });
  }

  void makeInputNegative(String operation) {
    if (firstParam.contains("-")) {
      setState(() {
        firstParam = firstParam.substring(2, firstParam.length);
      });
    } else {
      setState(() {
        firstParam = "(-$firstParam";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black12,
              Colors.black,
            ],
          )),
          child: Column(
            children: [
              DisplayScreen(
                firstParam: firstParam,
                secondParam: secondParam,
                operator: operator,
              ),
              const Divider(color: Colors.grey, height: 30),
              KeyboardScreen(
                changeState: changeState,
                handleOperatorOnPress: handleOperatorOnPress,
                deleteLastInput: deleteLastInput,
                clearAll: clearAll,
                addPercantage: addPercantage,
                makeInputNegative: makeInputNegative,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class KeyboardScreen extends StatelessWidget {
  const KeyboardScreen({
    super.key,
    required this.changeState,
    required this.handleOperatorOnPress,
    required this.deleteLastInput,
    required this.clearAll,
    required this.addPercantage,
    required this.makeInputNegative,
  });
  final void Function(String) changeState;
  final void Function(String) handleOperatorOnPress;
  final void Function(String) deleteLastInput;
  final void Function(String) clearAll;
  final void Function(String) addPercantage;
  final void Function(String) makeInputNegative;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 6,
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          child: Column(
            children: [
              FirstRow(
                changeState: changeState,
                handleOperatorOnPress: handleOperatorOnPress,
                deleteLastInput: deleteLastInput,
                clearAll: clearAll,
                addPercantage: addPercantage,
                makeInputNegative: makeInputNegative,
              ),
              SecondRow(
                changeState: changeState,
                handleOperatorOnPress: handleOperatorOnPress,
                deleteLastInput: deleteLastInput,
                clearAll: clearAll,
              ),
              ThirdRow(
                changeState: changeState,
                handleOperatorOnPress: handleOperatorOnPress,
                deleteLastInput: deleteLastInput,
                clearAll: clearAll,
              ),
              FourthRow(
                changeState: changeState,
                handleOperatorOnPress: handleOperatorOnPress,
                deleteLastInput: deleteLastInput,
                clearAll: clearAll,
              ),
              FifthRow(
                changeState: changeState,
                handleOperatorOnPress: handleOperatorOnPress,
                deleteLastInput: deleteLastInput,
                clearAll: clearAll,
              ),
            ],
          ),
        ));
  }
}

class FifthRow extends StatelessWidget {
  const FifthRow({
    super.key,
    required this.changeState,
    required this.handleOperatorOnPress,
    required this.deleteLastInput,
    required this.clearAll,
  });
  final void Function(String) changeState;
  final void Function(String) handleOperatorOnPress;
  final void Function(String) deleteLastInput;
  final void Function(String) clearAll;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OperatorButton(
          operatorIcon: FontAwesomeIcons.c,
          operatorString: "clear",
          handleOperatorOnPress: clearAll,
        ),
        NumbersButton(
            numberIcon: FontAwesomeIcons.zero,
            changeState: changeState,
            numberString: "0"),
        DotButton(
          changeState: changeState,
        ),
        OperatorButton(
            operatorIcon: FontAwesomeIcons.equals,
            operatorColor: Colors.white,
            operatorBackgroundColor: Colors.red,
            operatorString: "=",
            handleOperatorOnPress: handleOperatorOnPress),
      ],
    ));
  }
}

class FourthRow extends StatelessWidget {
  const FourthRow({
    super.key,
    required this.changeState,
    required this.handleOperatorOnPress,
    required this.deleteLastInput,
    required this.clearAll,
  });
  final void Function(String) changeState;
  final void Function(String) handleOperatorOnPress;
  final void Function(String) deleteLastInput;
  final void Function(String) clearAll;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NumbersButton(
            numberIcon: FontAwesomeIcons.one,
            changeState: changeState,
            numberString: "1"),
        NumbersButton(
            numberIcon: FontAwesomeIcons.two,
            changeState: changeState,
            numberString: "2"),
        NumbersButton(
            numberIcon: FontAwesomeIcons.three,
            changeState: changeState,
            numberString: "3"),
        OperatorButton(
            operatorIcon: FontAwesomeIcons.plus,
            operatorString: "+",
            handleOperatorOnPress: handleOperatorOnPress),
      ],
    ));
  }
}

class ThirdRow extends StatelessWidget {
  const ThirdRow({
    super.key,
    required this.changeState,
    required this.handleOperatorOnPress,
    required this.deleteLastInput,
    required this.clearAll,
  });
  final void Function(String) changeState;
  final void Function(String) handleOperatorOnPress;
  final void Function(String) deleteLastInput;
  final void Function(String) clearAll;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NumbersButton(
            numberIcon: FontAwesomeIcons.four,
            changeState: changeState,
            numberString: "4"),
        NumbersButton(
            numberIcon: FontAwesomeIcons.five,
            changeState: changeState,
            numberString: "5"),
        NumbersButton(
            numberIcon: FontAwesomeIcons.six,
            changeState: changeState,
            numberString: "6"),
        OperatorButton(
            operatorIcon: FontAwesomeIcons.minus,
            operatorString: "-",
            handleOperatorOnPress: handleOperatorOnPress),
      ],
    ));
  }
}

class SecondRow extends StatelessWidget {
  const SecondRow({
    super.key,
    required this.changeState,
    required this.handleOperatorOnPress,
    required this.deleteLastInput,
    required this.clearAll,
  });
  final void Function(String) changeState;
  final void Function(String) handleOperatorOnPress;
  final void Function(String) deleteLastInput;
  final void Function(String) clearAll;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NumbersButton(
            numberIcon: FontAwesomeIcons.seven,
            changeState: changeState,
            numberString: "7"),
        NumbersButton(
            numberIcon: FontAwesomeIcons.eight,
            changeState: changeState,
            numberString: "8"),
        NumbersButton(
          numberIcon: FontAwesomeIcons.nine,
          changeState: changeState,
          numberString: "9",
        ),
        OperatorButton(
            operatorIcon: FontAwesomeIcons.xmark,
            operatorString: "x",
            handleOperatorOnPress: handleOperatorOnPress),
      ],
    ));
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({
    super.key,
    required this.changeState,
    required this.handleOperatorOnPress,
    required this.deleteLastInput,
    required this.clearAll,
    required this.addPercantage,
    required this.makeInputNegative,
  });
  final void Function(String) changeState;
  final void Function(String) handleOperatorOnPress;
  final void Function(String) deleteLastInput;
  final void Function(String) clearAll;
  final void Function(String) addPercantage;
  final void Function(String) makeInputNegative;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OperatorButton(
            operatorIcon: FontAwesomeIcons.plusMinus,
            operatorString: "plus-minus",
            handleOperatorOnPress: makeInputNegative),
        OperatorButton(
            operatorIcon: FontAwesomeIcons.divide,
            operatorString: "/",
            handleOperatorOnPress: handleOperatorOnPress),
        OperatorButton(
            operatorIcon: FontAwesomeIcons.percent,
            operatorString: "%",
            handleOperatorOnPress: addPercantage),
        OperatorButton(
            operatorIcon: FontAwesomeIcons.deleteLeft,
            operatorString: "delete",
            handleOperatorOnPress: deleteLastInput),
      ],
    ));
  }
}

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({
    super.key,
    required this.firstParam,
    required this.operator,
    required this.secondParam,
  });
  final String firstParam;
  final String operator;
  final String secondParam;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$secondParam $operator',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.end,
                ),
                firstParam.isEmpty
                    ? Text(
                        "0",
                        style: Theme.of(context).textTheme.headlineLarge,
                      )
                    : Text(
                        firstParam,
                        style: Theme.of(context).textTheme.headlineLarge,
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DotButton extends StatelessWidget {
  const DotButton({
    super.key,
    required this.changeState,
  });
  final void Function(String) changeState;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => changeState("."),
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(21))),
        child: Text(
          ".",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w800, fontSize: 20),
        ));
  }
}

class NumbersButton extends StatelessWidget {
  const NumbersButton({
    super.key,
    required this.numberIcon,
    required this.changeState,
    required this.numberString,
  });
  final void Function(String) changeState;
  final String numberString;
  final IconData numberIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => changeState(numberString),
        child: Icon(
          numberIcon,
        ));
  }
}

class OperatorButton extends StatelessWidget {
  const OperatorButton({
    super.key,
    required this.operatorIcon,
    this.operatorColor = Colors.grey,
    this.operatorBackgroundColor = const Color.fromARGB(168, 81, 80, 80),
    required this.handleOperatorOnPress,
    required this.operatorString,
  });

  final IconData operatorIcon;
  final void Function(String) handleOperatorOnPress;
  final String operatorString;
  final Color? operatorColor;
  final Color? operatorBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => handleOperatorOnPress(operatorString),
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStatePropertyAll(operatorBackgroundColor)),
        child: Icon(
          operatorIcon,
          color: operatorColor,
        ));
  }
}

class TextWidgetTemp extends StatelessWidget {
  const TextWidgetTemp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '+',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
