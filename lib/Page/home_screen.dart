import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ggtt/Page/CreateTeam.dart';
import 'package:ggtt/WidgetCard/KCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          Container(
            width: a.width,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: a.width / 80, right: a.width / 80),
                  child: Container(
                    width: a.width,
                    height: a.width / 35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.school,
                                color: Color(0xffF49F12),
                                size: a.width / 45,
                              ),
                              Text(
                                " KATI   ",
                                style: TextStyle(
                                    color: Color(0xff535353),
                                    fontSize: a.width / 55),
                              ),
                              text1("หน้าหลัก"),
                              text1("หมวดหมู่"),
                              text1("ข่าวสาร"),
                              text1("บทความ"),
                              text1("Kati Awards"),
                              text1("เกี่ยวกับ")
                            ],
                          ),
                        ),
                        Container(
                          width: a.width / 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              CircleAvatar(),
                              Text(
                                "Kittipop Rakkawn",
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: a.height / 1,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: a.width / 100,
                      right: a.width / 100,
                      left: a.width / 100),
                  width: a.width,
                  height: a.height / 1.07,
                  color: Colors.green,
                ),
                Positioned(
                  left: a.width / 2.5,
                  top: a.height / 1.1,
                  child: Container(
                    padding: EdgeInsets.only(
                        right: a.width / 100, left: a.width / 100),
                    width: a.width / 4.5,
                    height: a.width / 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(a.width),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius:
                              20.0, // has the effect of softening the shadow
                          spreadRadius:
                              0.0, // has the effect of extending the shadow
                          offset: Offset(
                            1.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("ค้นหาโครงงานที่คุณสนใจ"),
                        Container(
                          width: a.width / 30,
                          height: a.width / 30,
                          decoration: BoxDecoration(
                              color: Color(0xffF49E17),
                              borderRadius: BorderRadius.circular(a.width)),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: a.width / 60),
                  width: a.width,
                  child: Text("สุดยอดโครงงานประจำเดือน ",
                      style: TextStyle(
                          fontSize: a.width / 50, color: Color(0xff535353))),
                ),
                KCard(num1: "1",text1: "คอมพิวเตอร์&หุ่นยนต์",text2: "บ้ายฝักไข่ไดโนเสาร์",text3: "ชื่อทีมผู้จำทำ",text4: "โรงเรียนหาดใหญ่วิทยาลัย",)
              ],
            ),
          )
        ],
      ),
    );
  }

  text1(String text) {
    Size a = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: a.width / 80),
      child: Text(
        text,
        style: TextStyle(color: Color(0xff848484), fontSize: a.width / 85),
      ),
    );
  }
}
