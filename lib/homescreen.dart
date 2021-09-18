import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  AnimationController? _controller;
  CurvedAnimation? _curvedAnimation;

  @override
  void initState() {
    super.initState();
    animation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  animation() {
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _curvedAnimation =
        CurvedAnimation(parent: _controller!, curve: Curves.bounceOut);
    _curvedAnimation!.addListener(() {
      setState(() {});
      print(_controller?.value);
    });
    _curvedAnimation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("Completed");
        _controller?.reverse();
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
        });
      }
    });
  }

  void roll() {
    _controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dicee'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onDoubleTap: roll,
                      child: Image(
                        image: AssetImage(
                            'assets/images/dice-png-$leftDiceNumber.png'),
                        height: 200 - _curvedAnimation!.value * 100,
                        width: 200,
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onDoubleTap: roll,
                      child: Image(
                        image: AssetImage(
                            'assets/images/dice-png-$rightDiceNumber.png'),
                        height: 200 - _curvedAnimation!.value * 100,
                        width: 200,
                      ),
                    ),
                  ))
                ],
              ),
              ElevatedButton(onPressed: roll, child: const Text('Roll'))
            ],
          ),
        ));
  }
}
