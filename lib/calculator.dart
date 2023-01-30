import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(20),
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
                            style: Theme.of(context).textTheme.headlineMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Divider(color: Colors.grey, height: 5),
              Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    child: Column(children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                '+',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('de')),
                        ],
                      )),
                    ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
