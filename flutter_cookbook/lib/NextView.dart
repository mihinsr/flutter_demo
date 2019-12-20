import 'package:flutter/material.dart';

class NextView extends StatefulWidget
{
  final String name;

  // In the constructor, require a Todo.
  NextView({Key key, @required this.name}) : super(key: key);

  @override
  NextViewState createState() =>  NextViewState();
  
}

class NextViewState extends State<NextView>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[      // Add 3 lines from here...
          IconButton(icon: Icon(Icons.list), onPressed: () {}),
        ],                      // ... to here.
      ),
      body: Center(child: Text(widget.name))
    );
  }
}