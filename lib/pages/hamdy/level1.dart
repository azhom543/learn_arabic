import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kids_game_eslam/pages/hamdy/level11.dart';

// ignore: must_be_immutable

class Level1 extends StatefulWidget {
  @override
  _Level1State createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  int score = 0;
  Color _buttonColor1 = Colors.blue;
  Color _buttonColor2 = Colors.blue;
  Color _buttonColor3 = Colors.blue;
  Color _buttonColor4 = Colors.blue;
  Color _buttonColor5 = Colors.blue;
  Color _buttonColor6 = Colors.blue;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          
          
          backgroundColor: Colors.blue,
          title: (Text(
            'Choose the correct letters',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  'assets/nemr.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(1),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 23,
                          child: Text(
                            'أ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: _buttonColor1,
                        ),
                        onTap: () {
                          setState(() {
                            _buttonColor1 = Colors.red;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(1),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 23,
                          child: Text(
                            'ر',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: _buttonColor2,
                        ),
                        onTap: () {
                          setState(() {
                            _buttonColor2 = Colors.green;
                            score++;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(1),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 23,
                          child: Text(
                            'ك',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: _buttonColor3,
                        ),
                        onTap: () {
                          setState(() {
                            _buttonColor3 = Colors.red;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 23,
                          child: Text(
                            'ن',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: _buttonColor4,
                        ),
                        onTap: () {
                          setState(() {
                            _buttonColor4 = Colors.green;
                            score++;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(1),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 23,
                          child: Text(
                            'ع',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: _buttonColor5,
                        ),
                        onTap: () {
                          setState(() {
                            _buttonColor5 = Colors.red;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(1),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 23,
                          child: Text(
                            'م',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: _buttonColor6,
                        ),
                        onTap: () {
                          setState(() {
                            _buttonColor6 = Colors.green;
                            score++;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              
              (Text(
            'score:$score',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          )),
          Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                     margin: EdgeInsets.all(15),
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        if (score == 3) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Level12()));
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
