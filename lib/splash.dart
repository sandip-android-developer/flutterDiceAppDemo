import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dice_app/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  void dispose() {
    super.dispose();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lime, Colors.lightBlue],
            ),
          ),
          child: Text(
              'Let\'s play',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 60,
                shadows: <Shadow>[
                  Shadow(
                    blurRadius: 18,
                    color: Colors.black87,
                    offset: Offset.fromDirection(90, 2),
                  )
                ],
              ),
            ),
          
        ),
      ),
    );
  }
}
