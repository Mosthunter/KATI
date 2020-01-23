// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:ggtt/service/FireStore_Service.dart';

// import 'Team.dart';

// class CreateTeam extends StatefulWidget {
//   final String uid;
  
//   CreateTeam({@required this.uid});
//   @override
//   _CreateTeamState createState() => _CreateTeamState();
// }

// class _CreateTeamState extends State<CreateTeam> {
//   String team = '';
//   String value = '';
//   var key = GlobalKey<FormState>();
//   @override
//   void initState() {
//     print(widget.uid.toString());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//           stream: FirebaseHandler()
//               .searchCollection(collection: 'user', name: 'Name', value: value),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState != ConnectionState.active) {
//               return Text('loading...');
//             } else {
//               QuerySnapshot doc = snapshot.data;
//               return Container(
//                 child: Column(
//                   children: <Widget>[
//                     // Text(doc.docs[0].data()['Email'].toString()),
//                     // Text('snapshot.data.data()'),
//                     // Form(
//                     //   key: key,
//                     //   child: Column(
//                     //     children: <Widget>[
//                     //       TextFormField(
//                     //           onSaved: (id) => value = id,
//                     //           decoration:
//                     //               InputDecoration.collapsed(hintText: "ชื่อทีม"),
//                     //           keyboardType: TextInputType.emailAddress,
//                     //           style: TextStyle(fontSize: 18)),
//                     //           RaisedButton(onPressed: (){key.currentState.save(); if(key.currentState.validate()){
//                     //            print("hutter");
//                     //           }})
//                     //     ],
//                     //   ),
//                     // ),
//                     InkWell(child: Container(child: Text("1122"),),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Team(uid: widget.uid,),));},),
//                     InkWell(
//                       child: Text("ทีมครีเอเตอร์"),
//                       onTap: () {
//                         setState(() {
//                           team = 'ทีมครีเอเตอร์';
//                         });
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CreateTeam2(
//                                       uid: widget.uid,
//                                       team: team,
//                                     )));
//                       },
//                     ),
//                     InkWell(
//                       child: Text("ทีมธุรกิจ"),
//                       onTap: () {
//                         setState(() {
//                           team = 'ทีมธุรกิจ';
//                         });
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CreateTeam2(
//                                   uid: widget.uid,
//                                       team: team,
//                                     )));
//                       },
//                     ),
//                     InkWell(
//                       child: Text("ทีมผู้เชี่ยวชาญ"),
//                       onTap: () {
//                         setState(() {
//                           team = 'ทีมผู้เชี่ยวชาญ';
//                         });
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CreateTeam2(
//                                   uid: widget.uid,
//                                       team: team,
//                                     )));
//                       },
//                     )
//                   ],
//                 ),
//               );
//             }
//           }),
//     );
//   }
// }

// class CreateTeam2 extends StatefulWidget {
//   final String team;
//   final String uid;

//   CreateTeam2({@required this.team, @required this.uid});
//   @override
//   _CreateTeam2State createState() => _CreateTeam2State();
// }

// class _CreateTeam2State extends State<CreateTeam2> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController member1Controller = TextEditingController();
//   TextEditingController member2Controller = TextEditingController();
//   TextEditingController member3Controller = TextEditingController();
//   TextEditingController teamController = TextEditingController();
//   TextEditingController m1Controller = TextEditingController();
//   TextEditingController m2Controller = TextEditingController();
//   TextEditingController m3Controller = TextEditingController();
//   TextEditingController m4Controller = TextEditingController();

//   createTeam(String name, title, m1, m2, m3, m4) async {
//     try {
//       await firestore().collection('Team').add({
//         'typeTeam': widget.team,
//         'NameTeam': name,
//         'SubTitle': title,
//         'Leader': widget.uid,
//         'member1': m1,
//         'member2': m2,
//         'member3': m3,
//         'member4': m4,
//       }).then((doc) {
//         firestore()
//             .collection('Team')
//             .doc(doc.id)
//             .update(data: {'teamID': doc.id});
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   create() {
//     String name = nameController.text.trim();
//     String title = titleController.text.trim();
//     String m1 = member1Controller.text.trim();
//     String m2 = member2Controller.text.trim();
//     String m3 = member3Controller.text.trim();
//     String m4 = member1Controller.text.trim();
//     createTeam(name, title, m1, m2, m3, m4);
//     Navigator.push(context, MaterialPageRoute(builder: (context)=> Team(uid: widget.uid,)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           buildTextFieldName(),
//           buildTextFieldtile(),
//           buildTextFieldmember1(),
//           buildTextFieldmember2(),
//           buildTextFieldmember3(),
//           buildButtonSignUp()
//         ],
//       ),
//     );
//   }

//   Container buildButtonSignUp() {
//     return Container(
//         constraints: BoxConstraints.expand(height: 50),
//         child: InkWell(
//           child: Text("Sign up",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18, color: Colors.white)),
//           onTap: () => create(),
//         ),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16), color: Colors.green[200]),
//         margin: EdgeInsets.only(top: 16),
//         padding: EdgeInsets.all(12));
//   }

//   Container buildTextFieldName() {
//     return Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//             color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
//         child: TextField(
//             controller: nameController,
//             decoration: InputDecoration.collapsed(hintText: "ชื่อทีม"),
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(fontSize: 18)));
//   }

//   Container buildTextFieldtile() {
//     return Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//             color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
//         child: TextField(
//             controller: titleController,
//             decoration: InputDecoration.collapsed(hintText: "อธิบาย"),
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(fontSize: 18)));
//   }

//   Container buildTextFieldmember1() {
//     return Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//             color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
//         child: TextField(
//             controller: member1Controller,
//             decoration: InputDecoration.collapsed(hintText: "สมาชิก1"),
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(fontSize: 18)));
//   }

//   Container buildTextFieldmember2() {
//     return Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//             color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
//         child: TextField(
//             controller: member2Controller,
//             decoration: InputDecoration.collapsed(hintText: "สมาชิก2"),
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(fontSize: 18)));
//   }

//   Container buildTextFieldmember3() {
//     return Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//             color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
//         child: TextField(
//             controller: member3Controller,
//             decoration: InputDecoration.collapsed(hintText: "สมาชิก3"),
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(fontSize: 18)));
//   }
// }
