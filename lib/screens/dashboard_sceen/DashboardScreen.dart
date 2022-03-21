import 'dart:ui';

import 'package:fliutter_init_zero/database/dao/DashGroupDao.dart';
import 'package:fliutter_init_zero/database/database.dart';
import 'package:fliutter_init_zero/database/entity/DashGroupEntity.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

late  DashGroupDao dashGroupDao;
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


    init();
    saveDashBoard(context);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child:
          Container(
            width: 500,
            child: TextButton(
              style: TextButton.styleFrom(

                // padding: const EdgeInsets.all(16.0),
                primary: Colors.brown,
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: ()  async {



             //  Future<int?> cnt = dashGroupDao.getCNT() ;
               int? cnt = await dashGroupDao.getCNT() ;
               print("count=  ${cnt}");

              },
              child: const Text('Login'),
            ),
          ),




      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



void saveDashBoard(BuildContext context) async {



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

      await dashGroupDao.saveDashGroup(new DashGroup(0, 1, 1,"","",0,0,"","" ));

    }







  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}


void init() async
{

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();


    dashGroupDao = database.dashGroupDao;

}
