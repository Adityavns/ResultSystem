import 'package:flutter/material.dart';
import 'package:result_viewer/list_of_results/results_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Results',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListOfResults(),
    );
  }
}
