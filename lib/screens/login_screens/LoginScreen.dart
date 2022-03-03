import 'dart:ui';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //
  //     _counter=_counter+2;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
        children: [

            TextField(
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(

                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),



            TextField(
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(

                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),


          Padding(	padding: EdgeInsets.only(top: 10.0, ), ),


          Container(
            width: 500,
            child: TextButton(
              style: TextButton.styleFrom(

                // padding: const EdgeInsets.all(16.0),
                primary: Colors.brown,
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('Login'),
            ),
          ),


        ],
      ),
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
