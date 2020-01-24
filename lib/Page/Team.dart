import 'package:firebase/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ggtt/service/FireStore_Service.dart';

class Team extends StatefulWidget {
  final String uid;
  Team({@required this.uid});
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseHandler().searchCollection(
                collection: 'Team', name: 'Leader'),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.active) {
                return Text('loading...');
              } else {
                QuerySnapshot doc = snapshot.data;
                return ListView.builder(
                  itemCount: doc.docs.length,
                  itemBuilder: (context, index) {
                    Size a = MediaQuery.of(context).size;
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: a.width / 10,
                            height: a.width / 10,
                            color: Colors.black26,
                            child: Column(
                              children: <Widget>[
                                Text(doc.docs[index]
                                    .data()['typeTeam']
                                    .toString()),
                                Text(doc.docs[index]
                                    .data()['NameTeam']
                                    .toString()),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }
            }));
  }
}
