import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListStatefulWedgit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListStateDemo();
  }
}

class ListStateDemo extends State<ListStatefulWedgit> {
  List<String> items = ['one', 'two', 'three', 'four'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView.builder'),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Text("${items[index]}");
            }),
      ),
    );
  }
}
