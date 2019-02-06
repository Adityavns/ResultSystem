import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ListOfResults extends StatefulWidget {
  final ResultsScreenBloc bloc = ResultsScreenBloc.getInstance();
  @override
  _ListOfResultsState createState() => _ListOfResultsState();
}

class _ListOfResultsState extends State<ListOfResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("List of results"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FirebaseAnimatedList(
          query: widget.bloc.getQuery(),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) =>
              buildSelectResultWidget(snapshot),
          defaultChild: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget buildSelectResultWidget(DataSnapshot snapshot) {
    return new Text(snapshot.value.toString());
  }
}

class ResultsScreenBloc {
  static ResultsScreenBloc instance = new ResultsScreenBloc();

  Query getQuery() {
    FirebaseDatabase.instance
        .reference()
        .child("test")
        .child("resultsList")
        .push()
        .set("R13 1st Year");
    return FirebaseDatabase.instance
        .reference()
        .child("test")
        .child("resultsList");
  }

  static ResultsScreenBloc getInstance() {
    return instance;
  }
}
