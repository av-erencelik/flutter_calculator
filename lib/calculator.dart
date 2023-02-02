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
                            OperatorButton(operatorIcon: FontAwesomeIcons.c),
                            OperatorButton(operatorIcon: FontAwesomeIcons.c),
                            OperatorButton(operatorIcon: FontAwesomeIcons.c),
                            OperatorButton(operatorIcon: FontAwesomeIcons.c),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            NumbersButton(),
                            NumbersButton(),
                            NumbersButton(),
                            OperatorButton(operatorIcon: FontAwesomeIcons.c),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            NumbersButton(),
                            NumbersButton(),
                            NumbersButton(),
                            OperatorButton(operatorIcon: FontAwesomeIcons.c),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            NumbersButton(),
                            NumbersButton(),
                            NumbersButton(),
                            OperatorButton(operatorIcon: Icons.abc),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            OperatorButton(
                              operatorIcon: FontAwesomeIcons.c,
                            ),
                            NumbersButton(),
                            NumbersButton(),
                            OperatorButton(operatorIcon: FontAwesomeIcons.c),
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

class NumbersButton extends StatelessWidget {
  const NumbersButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ));
  }
}

class OperatorButton extends StatelessWidget {
  const OperatorButton({
    super.key,
    required this.operatorIcon,
  });

  final IconData operatorIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Icon(
          operatorIcon,
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
