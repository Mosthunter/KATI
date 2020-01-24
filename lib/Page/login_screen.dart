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
        //color: Color(0xffF6A41F),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.amber,
              Colors.amber[700],
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 60.0),
              width: a.width,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  Text(
                    "ย้อนกลับ   ",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(a.width / 15, 0, a.width / 15, 0),
              //color: Colors.black26,
              width: a.width,
              height: a.height / 1.75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    // color: Colors.black38,
                    width: a.width / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "สนับสนุน ",
                          style: TextStyle(
                            fontSize: a.width / 20,
                            color: Colors.white,
                            letterSpacing: 6,
                          ),
                        ),
                        Text(
                          "ความคิด ",
                          style: TextStyle(
                            fontSize: a.width / 20,
                            color: Colors.white,
                            letterSpacing: 6,
                          ),
                        ),
                        Text(
                          "สร้างสรรค์ ",
                          style: TextStyle(
                            fontSize: a.width / 20,
                            color: Colors.white,
                            letterSpacing: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.black38,
                    width: a.width / 1.9,
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
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
                                      "กรอกข้อมูลเพื่อเข้าสู่ระบบ",
                                      style: TextStyle(fontSize: a.width / 60),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffEBEBEB),
                                          borderRadius:
                                              BorderRadius.circular(a.width)),
                                      width: a.width / 5,
                                      height: a.width / 40,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Email'),
                                        validator: (value) => value.isEmpty
                                            ? 'Email is required'
                                            : validateEmail(value.trim()),
                                        onChanged: (value) {
                                          this.email = value;
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: a.width / 80),
                                      decoration: BoxDecoration(
                                          color: Color(0xffEBEBEB),
                                          borderRadius:
                                              BorderRadius.circular(a.width)),
                                      width: a.width / 5,
                                      height: a.width / 40,
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Password'),
                                        validator: (value) => value.isEmpty
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
                                  child: Image.asset("assets/nauun.png",
                                      width: a.width / 10,
                                      height: a.width / 10))
                            ],
                          ),
                          Container(
                            // color: Colors.black26,
                            height: a.width / 10,
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
                                      if (formKey.currentState.validate()) {
                                        AuthService().signIn(email, password);
                                      }
                                    },
                                    child: Container(
                                        height: a.width / 30,
                                        width: a.width / 12,
                                        decoration: BoxDecoration(
                                            color: Color(0xffEBB00E),
                                            borderRadius:
                                                BorderRadius.circular(a.width)),
                                        child: Center(
                                            child: Text(
                                          'ยืนยัน',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: a.width / 80),
                                        )))),
                              ],
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: a.width,
              height: 110.0,
            ),
          ],
        ),
      ),
    ));
  }
}
