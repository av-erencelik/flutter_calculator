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
  void changeState(String key) {
    if (firstParam.isNotEmpty) {
      if (firstParam[0] == "0" && key == "0") return;
      if (firstParam.contains(".") && key == ".") return;
    }

    setState(() {
      firstParam = "$firstParam$key";
    });
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
                latestParam: firstParam,
              ),
              const Divider(color: Colors.grey, height: 30),
              KeyboardScreen(
                changeState: changeState,
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
  });
  final void Function(String) changeState;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 6,
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          child: Column(
            children: [
              FirstRow(changeState: changeState),
              SecondRow(changeState: changeState),
              ThirdRow(changeState: changeState),
              FourthRow(changeState: changeState),
              FifthRow(
                changeState: changeState,
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
  });
  final void Function(String) changeState;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const OperatorButton(
          operatorIcon: FontAwesomeIcons.c,
        ),
        NumbersButton(
            numberIcon: FontAwesomeIcons.zero,
            changeState: changeState,
            numberString: "0"),
        DotButton(
          changeState: changeState,
        ),
        const OperatorButton(
          operatorIcon: FontAwesomeIcons.equals,
          operatorColor: Colors.white,
          operatorBackgroundColor: Colors.red,
        ),
      ],
    ));
  }
}

class FourthRow extends StatelessWidget {
  const FourthRow({
    super.key,
    required this.changeState,
  });
  final void Function(String) changeState;

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
        const OperatorButton(operatorIcon: FontAwesomeIcons.plus),
      ],
    ));
  }
}

class ThirdRow extends StatelessWidget {
  const ThirdRow({
    super.key,
    required this.changeState,
  });
  final void Function(String) changeState;

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
        const OperatorButton(operatorIcon: FontAwesomeIcons.minus),
      ],
    ));
  }
}

class SecondRow extends StatelessWidget {
  const SecondRow({
    super.key,
    required this.changeState,
  });
  final void Function(String) changeState;

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
        const OperatorButton(operatorIcon: FontAwesomeIcons.xmark),
      ],
    ));
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({
    super.key,
    required this.changeState,
  });
  final void Function(String) changeState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        OperatorButton(operatorIcon: FontAwesomeIcons.plusMinus),
        OperatorButton(operatorIcon: FontAwesomeIcons.divide),
        OperatorButton(operatorIcon: FontAwesomeIcons.percent),
        OperatorButton(operatorIcon: FontAwesomeIcons.deleteLeft),
      ],
    ));
  }
}

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({
    super.key,
    required this.latestParam,
  });
  final String latestParam;
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
                  '150 +',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.end,
                ),
                Text(
                  latestParam,
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
  });

  final IconData operatorIcon;
  final Color? operatorColor;
  final Color? operatorBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
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
