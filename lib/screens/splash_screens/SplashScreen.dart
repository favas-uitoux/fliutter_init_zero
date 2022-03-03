import 'dart:async';
import 'dart:ui';

import 'package:fliutter_init_zero/screens/login_screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;
  _AnimatedFlutterLogoState() {
    _timer = new Timer(const Duration(milliseconds: 6000), () {
      setState(() {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen(),
        ));

      });
    });
  }
  

  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    _AnimatedFlutterLogoState();


    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:

      Lottie.asset(
      'assets/eshop.json',

    height: MediaQuery.of(context).size.height * 1,
    animate: true,



      ),

    );
  }
}


