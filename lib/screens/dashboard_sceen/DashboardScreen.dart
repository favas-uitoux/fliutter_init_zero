import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class DashBoardScreen extends StatelessWidget {
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

    saveDashBoard(context);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child:Text("Bismillah")




      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



void saveDashBoard(BuildContext context) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  //var url =
  var client = http.Client();
  var response = await client.post(
      Uri.https('www.milantex.in', 'zpa/read_dasboard_category_customer.php'),
      body: {'apikey': '100', });

  // Await the http get response, then decode the json-formatted response.
  //var response = await http.post(url);
  if (response.statusCode == 200) {

    print('Response body: ${response.body}');

    var jsonResponse =
    convert.jsonDecode(response.body) as Map<String, dynamic>;

var details=jsonResponse["details"];

 var sze=   details.length;

    for( var i = 0 ; i < sze; i++ ) {

      print('ok ${i}');

    }







  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
