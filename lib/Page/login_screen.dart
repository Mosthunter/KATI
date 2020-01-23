import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ggtt/Service/auth_Service.dart';
import 'SignUp_Page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
            key: formKey,
            child: Container(
              width: a.width,
              height: a.height,
              color: Color(0xffF6A41F),
              child: Padding(
                padding: EdgeInsets.all(a.width / 60),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: a.width,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                            size: a.width / 50,
                          ),
                          Text(
                            "ย้อนกลับ",
                            style: TextStyle(
                                color: Colors.white, fontSize: a.width / 50),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: a.height / 1.15,
                            padding: EdgeInsets.only(top: a.height / 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text1("ส นั บ ส นุ น"),
                                text1("ค ว า ม คิ ด"),
                                text1("ส ร้ า ง ส ร ร ค์"),
                              ],
                            ),
                          ),
                          Card(
                            child: Container(
                                width: a.width / 2,
                                height: a.width / 3,
                                child: Column(
                                  children: <Widget>[
                                    Text("เข้าสู่ระบบ"),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: a.width / 20,
                                              right: a.width / 40,
                                              left: a.width / 40),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                  "กรอกข้อมูลเพื่อเข้าสู่ระบบ",style: TextStyle(fontSize: a.width/60),),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xffEBEBEB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            a.width)),
                                                width: a.width / 5,
                                                height: a.width / 40,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: 'Email'),
                                                  validator: (value) =>
                                                      value.isEmpty
                                                          ? 'Email is required'
                                                          : validateEmail(
                                                              value.trim()),
                                                  onChanged: (value) {
                                                    this.email = value;
                                                  },
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: a.width / 80),
                                                decoration: BoxDecoration(
                                                    color: Color(0xffEBEBEB),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            a.width)),
                                                width: a.width / 5,
                                                height: a.width / 40,
                                                child: TextFormField(
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: 'Password'),
                                                  validator: (value) => value
                                                          .isEmpty
                                                      ? 'Password is required'
                                                      : null,
                                                  onChanged: (value) {
                                                    this.password = value;
                                                  },
                                                ),
                                              ),
                                              Text("ลืมรหัสผ่าน")
                                            ],
                                          ),
                                        ),
                                        Container(
                                            width: a.width / 10,
                                            height: a.width / 10,
                                            child: Image.asset(
                                                "assets/nauun.png",
                                                width: a.width / 10,
                                                height: a.width / 10))
                                      ],
                                    ),
                                    Container(
                                      color: Colors.black26,
                                      height: a.width/10,
                                      child: Row(
                                        children: <Widget>[
                                          InkWell(
                                            child: Text("สมัครสมาชิก"),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MySignUpPage()));
                                            },
                                          ),
                                          InkWell(
                                              onTap: () {
                                                if (checkFields() &&
                                                    formKey.currentState
                                                        .validate()) {
                                                  AuthService()
                                                      .signIn(email, password);
                                                }
                                              },
                                              child: Container(
                                                  height: a.width / 30,
                                                  width: a.width / 12,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffEBB00E),
                                                    borderRadius: BorderRadius.circular(a.width)
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    'ยืนยัน',
                                                    style: TextStyle(
                                                        color: Colors.white,fontSize: a.width/80),
                                                  )))),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  text1(String text001) {
    return Text(
      text001,
      style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width / 15),
    );
  }
}
