import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Utils/NetworkUtil.dart';
import 'model/Data.dart';
import 'PostEmployee.dart' as employee;

class LiveDataList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LiveDataState();
}

class LiveDataState extends State<LiveDataList> {
  NetworkUtil _netUtil = new NetworkUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data List'),
      ),
      body: FutureBuilder<List<Data>>(
        future: _netUtil.fetchData(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index) {
                    return Card(
                        child: ListTile(
                      title: Text(snapshot.data[index].title),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => employee.PostEmployee()));
                      },
                    ));
                  })
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
