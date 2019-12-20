import 'package:flutter/material.dart';

import 'Model/client_model.dart';
import 'db/databaseHelper.dart';

class details extends StatefulWidget {
  @override
   //final String name;
  // details({Key key, @required this.name}) : super(key: key);
  details({Key key}) : super(key: key);
 // details(Key key,@required this.name}) : super(Key:Key);
   @override
  secondstate createState() => secondstate();
}

class secondstate extends State<details>{

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
     // body: Text("abcdbf"),
     // body:Center( Text(widget.name)),
         appBar: AppBar( actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              ClientDatabaseProvider.db.deleteAllClient();
              setState(() { 
                               ClientDatabaseProvider.db.getAllClients();
              });
            },
          )
        ],title: const Text('Selected state')),
        
      body: 
     FutureBuilder<List<Client>>(
        //we call the method, which is in the folder db file database.dart 
        future: ClientDatabaseProvider.db.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
            
              physics: BouncingScrollPhysics(),
              //Count all records
              itemCount: snapshot.data.length,
              //all the records that are in the client table are passed to an item Client item = snapshot.data [index];
              itemBuilder: (BuildContext context, int index){
                Client item = snapshot.data[index];
                //delete one register for id
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (diretion) {
                    ClientDatabaseProvider.db.deleteClientWithId(item.id);
                  },
                  //Now we paint the list with all the records, which will have a number, name, phone
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.discription),
                   // leading: CircleAvatar(child: Text(item.id.toString())),
                    leading: CircleAvatar(backgroundImage:NetworkImage(item.image)),
                    trailing: Icon(Icons.delete),onLongPress: (){
                         //Allert control 
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                               // return object of type Dialog
                              return AlertDialog(
                              title: new Text("Delete!"),
                              content: new Text("Do u sure want to delete.."),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                  FlatButton(
                                      child: Text('Cancel'),
                                      onPressed: () {
                                          Navigator.of(context).pop();
                                      }),
                                  FlatButton(
                                     child: Text('Delete'),
                                     onPressed: () {
                                           ClientDatabaseProvider.db.deleteClientWithId(item.id); 
                                           Navigator.of(context).pop();
                                               setState(() { 
                                                 ClientDatabaseProvider.db.getAllClients();
                                       if(snapshot.data.length <= 1)
                                       {
                                         print("nill");
                                         print(snapshot.data.length);
                                         Navigator.pop(context);
                                        
                                       }else{
                                         Client client = setData();
                                         Navigator.pop(context,client);
                                         print("Data not nill");
                                         print(snapshot.data.length);
                                       }
                                               });
                                      })
                                  ],
                                );
                              }
                            );
                     },
                    // onTap: () {
                    //  setState(() { 
                    //   ClientDatabaseProvider.db.getAllClients();
                    // });
                    // },
                  ),
                );
              },
            );
          }else {
            return Center(child: CircularProgressIndicator());
          }
        }));
  
  }
}

Client setData(){
  Client client = 
 Client(id: 12,name: "Civic");
return client;
}