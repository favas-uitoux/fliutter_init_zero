import 'dart:ui';

import 'package:fliutter_init_zero/screens/dashboard_sceen/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

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
              onPressed: () {

                apicall(context);

              },
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


void apicall(BuildContext context) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  //var url =
  var client = http.Client();
  var response = await client.post(
      Uri.https('www.milantex.in', 'zpa/login.php'),
      body: {'apikey': '100', 'mob': '8156846432','pswd': '123456',});

  // Await the http get response, then decode the json-formatted response.
  //var response = await http.post(url);
  if (response.statusCode == 200) {

    print('Response body: ${response.body}');

    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;


   String cust_id= jsonResponse["customer_id"];

    if (cust_id.length>0) {
      //

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashBoardScreen(),
          ));


    }
    else
      {
        print('Missing cust id');
      }


  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}