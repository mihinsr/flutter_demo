import 'package:bloc_provider_demo/Bloc/FormBloc.dart';
import 'package:bloc_provider_demo/View/Second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class First extends StatefulWidget{
  static String tag = 'First';
  @override
  FirstState createState() => FirstState();
}

class FirstState extends State<First>{
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
      appBar: AppBar(
        title: const Text('First'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<FormBloc>(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'First name',
            ),
            onChanged: (text){
              // added in bloc
              bloc.changeTextFirstName(text);
            },
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'First name is required';
              }
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Last name',
            ),
            onChanged: (text){
              // added in bloc
              bloc.changeTextLastName(text);
            },
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Last name is required';
              }
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            onChanged: (text){
              // added in bloc
              bloc.changeTextEmail(text);
            },
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
                onPressed:submit,
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }



  void submit() {
   if(_formKey.currentState.validate()){
     Navigator.pushNamed(context, Second.tag);
   }
    print('Form submitted');
  }

}