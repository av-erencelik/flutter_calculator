import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
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
              Expanded(
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
                            '23',
                            style: Theme.of(context).textTheme.headlineLarge,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Divider(color: Colors.grey, height: 30),
              Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            OperatorButton(
                                operatorIcon: FontAwesomeIcons.plusMinus),
                            OperatorButton(
                                operatorIcon: FontAwesomeIcons.divide),
                            OperatorButton(
                                operatorIcon: FontAwesomeIcons.percent),
                            OperatorButton(
                                operatorIcon: FontAwesomeIcons.deleteLeft),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            NumbersButton(numberIcon: FontAwesomeIcons.seven),
                            NumbersButton(numberIcon: FontAwesomeIcons.eight),
                            NumbersButton(numberIcon: FontAwesomeIcons.nine),
                            OperatorButton(
                                operatorIcon: FontAwesomeIcons.xmark),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            NumbersButton(numberIcon: FontAwesomeIcons.four),
                            NumbersButton(numberIcon: FontAwesomeIcons.five),
                            NumbersButton(numberIcon: FontAwesomeIcons.six),
                            OperatorButton(
                                operatorIcon: FontAwesomeIcons.minus),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            NumbersButton(numberIcon: FontAwesomeIcons.one),
                            NumbersButton(numberIcon: FontAwesomeIcons.two),
                            NumbersButton(numberIcon: FontAwesomeIcons.three),
                            OperatorButton(operatorIcon: FontAwesomeIcons.plus),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            OperatorButton(
                              operatorIcon: FontAwesomeIcons.c,
                            ),
                            NumbersButton(numberIcon: FontAwesomeIcons.zero),
                            DotButton(),
                            OperatorButton(
                              operatorIcon: FontAwesomeIcons.equals,
                              operatorColor: Colors.white,
                              operatorBackgroundColor: Colors.red,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class DotButton extends StatelessWidget {
  const DotButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(24))),
        child: const Text("."));
  }
}

class NumbersButton extends StatelessWidget {
  const NumbersButton({
    super.key,
    required this.numberIcon,
  });

  final IconData numberIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
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
