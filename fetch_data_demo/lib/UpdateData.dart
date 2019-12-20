import 'package:fetch_data_demo/Utils/NetworkUtil.dart';
import 'package:fetch_data_demo/model/Datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/UpdatedData.dart';

class UpdateData extends StatefulWidget {
  @override
  UpdateDataState createState() => UpdateDataState();
  Datas data;

  UpdateData({this.data});
}

class UpdateDataState extends State<UpdateData> {
  TextEditingController nameControler;
  TextEditingController salaryControler;
  TextEditingController ageControler;
  NetworkUtil _network = new NetworkUtil();
  UpdatedData _updatedData;
  var name = "";
  var salary = "";

  @override
  void initState() {
    super.initState();
     nameControler = new TextEditingController(text: widget.data.name);
     salaryControler = new TextEditingController(text: widget.data.salary);
     ageControler = new TextEditingController(text: widget.data.age);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Data"),
        ),
        body: Padding(

            padding: EdgeInsets.all(24.0),
            child: Center(
                child: ListView(children: <Widget>[
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
                    _updatedData = (await _network.UpdateDatas(
                        nameControler.text == ""
                            ? widget.data.name
                            : nameControler.text,
                        salaryControler.text == ""
                            ? widget.data.salary
                            : salaryControler.text,
                        ageControler.text == ""
                            ? widget.data.age
                            : ageControler.text,
                        widget.data.id)) as UpdatedData;

                    setState(() {
                      name = _updatedData.name;
                      salary = _updatedData.salary;
                    });
                    /*   Employee newPost = new Employee(
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
                    });*/
                  },
                  child: const Text("Update")),
              ListTile(
//                title: Text(nameControler.text),
//                subtitle: Text(salaryControler.text),
                title: Text(name),
                subtitle: Text(salary),
              )
            ]))));
  }
}
