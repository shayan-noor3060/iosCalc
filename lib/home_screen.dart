import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:widgets/constants.dart';
import 'components/MyBotton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var UserInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment : Alignment.bottomRight,
                          child: Text(
                            UserInput.toString(),
                            style: const TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Text(
                          answer.toString(),
                          style: const TextStyle(fontSize: 30, color: Colors.white),
                        )
                      ],
                    ),
                  )
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MyBotton(
                              title: 'AC',
                              onPress: () {
                                answer = '';
                                UserInput = '';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: '+/-',
                              onPress: () {},
                            ),
                            MyBotton(
                              title: '%',
                              onPress: () {
                                UserInput += '%';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: '/',
                              onPress: () {
                                UserInput += '/';
                                setState(() {
                                });
                              },
                              color: const Color(0xffffa00a),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyBotton(
                              title: '7',
                              onPress: () {
                                UserInput += '7';
                                setState(() {
                                });

                              },
                            ),
                            MyBotton(
                              title: '8',
                              onPress: () {
                                UserInput += '8';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: '0',
                              onPress: () {
                                UserInput += '0';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: 'x',
                              onPress: () {
                                UserInput += 'x';
                                setState(() {
                                });
                              },
                              color: Color(0xffffa00a),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyBotton(
                              title: '4',
                              onPress: () {
                                UserInput += '4';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: '5',
                              onPress: () {
                                UserInput += '5';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: '6',
                              onPress: () {
                                UserInput += '6';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: '-',
                              onPress: () {
                                UserInput += '-';
                                setState(() {
                                });
                              },
                              color: Color(0xffffa00a),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyBotton(
                              title: '1',
                              onPress: () {
                                UserInput += '1';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: '2',
                              onPress: () {
                                UserInput += '2';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: '3',
                              onPress: () {
                                UserInput += '3';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: '+',
                              onPress: () {
                                UserInput += '+';
                                setState(() {
                                });
                              },
                              color: Color(0xffffa00a),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyBotton(
                              title: '0',
                              onPress: () {
                                UserInput += '0';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: '.',
                              onPress: () {
                                UserInput += '.';
                                setState(() {
                                });
                              },
                            ),
                            MyBotton(
                              title: 'DEL',
                              onPress: () {
                                UserInput = UserInput.substring(0,UserInput.length - 1);
                                setState(() {

                                });
                              },
                            ),
                            MyBotton(
                              title: '=',
                              onPress: () {
                                equalPress();
                                setState(() {
                                   
                                });
                              },
                              color: const Color(0xffffa00a),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void equalPress(){
    String finalUserInput = UserInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}


