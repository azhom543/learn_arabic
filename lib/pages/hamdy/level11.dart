import 'package:flutter/material.dart';
import 'package:kids_game_eslam/pages/eslam/home_eslam.dart';
class Level12 extends StatefulWidget {
  @override
  _Level12State createState() => _Level12State();
}

class _Level12State extends State<Level12> {
  int score = 3;
  Color _buttonColor7 = Colors.blue;
  Color _buttonColor8 = Colors.blue;
  Color _buttonColor9 = Colors.blue;
  Color _buttonColor10 = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        
        backgroundColor: Colors.black,
        title: (Text(
          'Choose The Correct Answer',
          style: TextStyle(
            color: Colors.white,
          ),
        )),
      ),

      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(
                'assets/asdPhoto.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      color: _buttonColor7,
                      onPressed: () {
                        setState(() {
                          _buttonColor7 = Colors.red;
                        });
                      },
                      child: Text(
                        'نمر',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      color: _buttonColor8,
                      onPressed: () {
                        setState(() {
                          _buttonColor8 = Colors.red;
                        });
                      },
                      child: Text(
                        'فيل',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      color: _buttonColor9,
                      onPressed: () {
                        setState(() {
                          _buttonColor9 = Colors.green;
                           _buttonColor7 = Colors.red;
                            _buttonColor8 = Colors.red;
                             _buttonColor10 = Colors.red;
                           

                          score++;
                        });
                      },
                      child: Text(
                        'أسد',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      color: _buttonColor10,
                      
                      onPressed: () {
                        setState(() {
                          _buttonColor10 = Colors.red;
                        });
                      },
                      child: Text(
                        'قطة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 25,
              ),
             Text('Score:$score',style: TextStyle(
              color: Colors.white,
               fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
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
          ])),
    );
  }
}
