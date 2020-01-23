import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:ggtt/service/FireStore_Service.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String value = '';
  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseHandler().searchCollection(
            collection: 'user',
            name: 'userId',
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active) {
              return Text('loading...');
            } else {
              return Scaffold(
                body: Form(
                  key: key,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                            onSaved: (id) => value = id,
                            decoration:
                                InputDecoration.collapsed(hintText: "YourID"),
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(fontSize: 18)),
                      ),
                      RaisedButton(onPressed: () {
                        key.currentState.save();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CSearch(value: value,)));
                        if (key.currentState.validate()) {
                          print("hutter");
                        }
                      }),
                    ],
                  
                  ),
                ),
              );
            }
          }),
    );
  }
}

class CSearch extends StatefulWidget {
  final String value;
  CSearch({@required this.value});
  @override
  _CSearchState createState() => _CSearchState();
}

class _CSearchState extends State<CSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseHandler().searchCollection(
                collection: 'user', name: 'userID', value: widget.value),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.active) {
                return Text('loading...');
              } else {
                QuerySnapshot doc = snapshot.data;
                return Scaffold(
                  body: Text(doc.docs[0].data()['Name'].toString()),
                );
              }
            }));
  }
}
