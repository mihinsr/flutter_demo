import 'package:bloc_provider_demo/Bloc/FormBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  static String tag = 'Second';

  @override
  SecondState createState() => SecondState();
}

class SecondState extends State<Second> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FormBloc>(context);
    // retrive from bloc
    String firstName = bloc.getFirstName();
    String lastName = bloc.getLastName();
    String email = bloc.getemail();
    setState(() {
      firstnameController.value = new TextEditingController.fromValue(
          new TextEditingValue(text: firstName))
          .value;
      lastnameController.value = new TextEditingController.fromValue(
          new TextEditingValue(text: lastName))
          .value;
      emailController.value = new TextEditingController.fromValue(
          new TextEditingValue(text: email))
          .value;
    });
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  enabled: false,
                  decoration: InputDecoration(labelText: "First name"),
                  controller: firstnameController,
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'First name is required';
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "Last name",
                  ),

                  controller: lastnameController,
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Last name is required';
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),

                  controller: emailController,
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Email is required';
                    }
                  },
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    OutlineButton(
                      highlightedBorderColor: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Previous'),
                    ),
                  ],
                ),
              ],
            )));
  }
}
