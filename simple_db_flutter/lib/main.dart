import 'package:flutter/material.dart';
import 'package:simple_db_flutter/Model/client_model.dart';
import 'package:simple_db_flutter/db/databaseHelper.dart';
import 'Detail.dart' as detail;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
 // final String popdata;
 //  MyApp({Key key, @required this.popdata}) : super(key: key);
 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
 
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
      appBar: AppBar(title: Text('ListViews')),
        body: BodyLayout(),
        
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}



Widget _myListView(BuildContext context) {

  // backing data
  final gujaratCity = ['Ahmedabad','Amreli','bhavnagar','surat','rajkot'];
    final gujaratCityss = ['Ahmedabad is Good State','Amreli is Good State','bhavnagar is Good State','surat is Good State','rajkot is Good State'];
  final image = ['https://www.holidify.com/images/bgImages/AHMEDABAD.jpg','https://dummyimage.com/300','https://www.holidify.com/images/bgImages/AHMEDABAD.jpg','https://dummyimage.com/300','https://dummyimage.com/300'];
  
  return ListView.builder(
    itemCount: gujaratCity.length,
    itemBuilder: (context, index) {
      
      return ListTile(
       title: Text(gujaratCity[index]),
    
        leading:  CircleAvatar(
                backgroundImage:NetworkImage(image[index]),
              ),
        onTap: () {

           ClientDatabaseProvider.db.addClientToDatabase(new Client(
                          name: gujaratCity[index],
                          discription: gujaratCityss[index],
                          image: image[index]));
                          
                         // id: Widget.client.id ));
                        //  Navigator.pop(context);
          
         // Navigator.push(context, MaterialPageRoute(builder: (context)=> details.details()));
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=> details.details(name: gujaratCity[index])));
      
      
      //  _pushScreen(context,module.StateClass(name: gujaratCity[index] , name: gujaratCity[index]));
     _pushScreen(context,detail.details());
       //  _pushScreen(context,details.details(name: gujaratCity[index]));
         //todos[index].title
                 },
      );
    },
  );

}

Future _pushScreen(BuildContext context, Widget screen) async {
  Client c = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen,
    
  ));
  print("main: "+c.name);
}