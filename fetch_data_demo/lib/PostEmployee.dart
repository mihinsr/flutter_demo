import 'dart:convert';
import 'dart:core';

import 'package:fetch_data_demo/Utils/NetworkUtil.dart';
import 'package:fetch_data_demo/model/Datas.dart';
import 'package:fetch_data_demo/model/Employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UpdateData.dart' as update;

class PostEmployee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PostEmployeeState();
}

class PostEmployeeState extends State<PostEmployee> {
  NetworkUtil _netUtil = new NetworkUtil();

  Future<Employee> employee;
  var name = "";
  var salary = "";
  var id = "";
  Employee employeeDetail;
  var isLoading = false;
  TextEditingController nameControler = new TextEditingController();
  TextEditingController salaryControler = new TextEditingController();
  TextEditingController ageControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Post API Call"),
        ),
        body: Padding(
            padding: EdgeInsets.all(24.0),
            child: Center(
                child: ListView(
              children: <Widget>[
                TextField(
                  controller: nameControler,
                  decoration: InputDecoration(
                      hintText: "Enter your name", labelText: "Post Name"),
                ),
                TextField(
                  controller: salaryControler,
                  decoration: InputDecoration(
                      hintText: "Enter your salary", labelText: "Post Salary"),
                ),
                TextField(
                  controller: ageControler,
                  decoration: InputDecoration(
                      hintText: "Enter your age", labelText: "Post Age"),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 30.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    Employee newPost = new Employee(
                        name: nameControler.text,
                        salary: salaryControler.text,
                        age: ageControler.text);
                    employeeDetail = await _netUtil.PostData(
                        newPost.name, newPost.salary, newPost.age, newPost.id);
                    setState(() {
                      isLoading = true;
                      name = employeeDetail.name;
                      salary = employeeDetail.salary;
                      id = employeeDetail.id;
                    });
                  },
                  child: const Text("Create"),
                ),
                ListTile(
                  title: Text(name),
                  subtitle: Text(salary),
                  trailing:
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    new Container(
                      child: new IconButton(
                        icon: isLoading ? Icon(Icons.edit) : Icon(null),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => update.UpdateData(
                                        data: Datas(
                                            id: employeeDetail.id,
                                            salary: employeeDetail.salary,
                                            name: employeeDetail.name,
                                            age: employeeDetail.age),
                                      )));
                        },
                      ),
                      margin: EdgeInsets.only(top: 25.0),
                    ),
                    new Container(
                      child: new IconButton(
                        icon: isLoading ? Icon(Icons.delete) : Icon(null),
//                              new Icon(Icons.bookmark),
                        onPressed: () {
                          _netUtil.DeletePost(id);
                          setState(() {
                            isLoading = false;
                            name = "";
                            salary = "";
                            isLoading ? Icon(Icons.delete) : Icon(null);
                            isLoading ? Icon(Icons.edit) : Icon(null);
                          });
                        },
                      ),
                      margin: EdgeInsets.only(top: 25.0),
                    ),
                  ]),

                  /* isLoading ? Icon(Icons.delete): null,
                      onTap: (){
                        _netUtil.DeletePost(id);
                         setState(() {
                          isLoading = false;
                          name = "";
                          salary = "";
                          isLoading ? Icon(Icons.delete) : null;
                        });*/
                ),
                /* RaisedButton(
                        child: Text("GO TO NEXT"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => second.LiveDataList()));
                        })*/
              ],
            ))));
  }
}
