import 'package:fetch_data_demo/Utils/NetworkUtil.dart';
import 'package:flutter/material.dart';
import 'model/Post.dart';
import 'LiveDataList.dart' as second;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  NetworkUtil _netUtil = new NetworkUtil();

  Future<Post> post;


  @override
  void initState() {
    super.initState();
    post = _netUtil.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body:
        Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: <Widget>[
                  Text("Title :"),
                  Text(snapshot.data.title),
                  RaisedButton(child: Text("GO TO NEXT"), onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => second.LiveDataList()));
                  })
                ],);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return
                CircularProgressIndicator();
            },
          ),
        ));
  }
}
