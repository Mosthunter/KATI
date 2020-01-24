import 'package:flutter/material.dart';

class KCard extends StatefulWidget {
  final String text1;
  final String num1;
  final String text2;
  final String text3;
  final String text4;

  KCard(
      {@required this.text1,
      @required this.text2,
      @required this.text3,
      @required this.text4,
      @required this.num1});
  @override
  _KCardState createState() => _KCardState();
}

class _KCardState extends State<KCard> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(a.width / 200),
        color: Colors.grey,
      ),
      margin: EdgeInsets.only(top: a.width / 30),
      width: a.width / 4,
      height: a.width / 6,
      child: Stack(
        children: <Widget>[
          Container(
            width: a.width / 4,
            height: a.width / 6,
          ),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(a.width / 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(a.width / 200),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(a.width),
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        widget.text1,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: a.width / 50,
                      height: a.width / 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(a.width),
                          border: Border.all(color: Colors.white)),
                      child: Text(widget.num1),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: a.width / 200,
                    left: a.width / 200,
                    bottom: a.width / 200),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.text2,
                        style: TextStyle(
                            fontSize: a.width / 50, color: Colors.white),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            minRadius: a.width / 60,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                 " " + widget.text3,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: a.width / 90),
                                ),
                                Text(
                                  " สังกัด" + " : " + widget.text4,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: a.width / 90),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
