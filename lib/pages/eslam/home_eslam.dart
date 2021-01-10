// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'dart:math';
import 'package:kids_game_eslam/pages/adham/home.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var player = AudioCache();
  Map<String, bool> score = {};
  Map<String, Color> choices = {
    '🍎': Colors.red,
    '🍊': Colors.orange,
    '🥒': Colors.green,
    '🍋': Colors.yellow,
    '🍇': Colors.purple,
    '🍑': Colors.pink,
    '🥥': Colors.brown,
  };
  Map<String, String> names = {
    '🍎': 'تفاح',
    '🍊': 'برتقال',
    '🥒': 'خيار',
    '🍋': 'ليمون',
    '🍇': 'عناب',
    '🍑': 'خوخ',
    '🥥': 'جوز هند',
  };
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your scores')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: choices.keys.map((element) {
              return Expanded(
                child: Draggable<String>(
                  data: element,
                  child: Movable(score[element] == true ? '✔' : element,),
                  feedback: Movable(element,),
                  childWhenDragging: Movable('🐰',),
                  ),
              );
            }).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: choices.keys.map((element){
              return buildTarget(element);
            }).toList()..shuffle(Random(index)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next,),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => azhom()));
        },
      ),
    );
  }
  Widget buildTarget(element){
    return DragTarget<String>(
      builder: (context,incoming, rejected){
        if(score[element] == true){
          return Container(
            alignment: Alignment.center,
            height: 80,
            width: 200,
            color: Colors.white,
            child: Text(
              names[element],
            ),
          );
        }else
          {
            return Container(
              color: choices[element],
              height: 80,
              width: 200,
            );
          }
      },
      onWillAccept: (data) => data == element,
      onAccept: (data){
        setState(() {
          score[element] = true;
          player.play('correct.wav');
        });
      },
      onLeave: (data){

      },
    );
  }
}
class Movable extends StatelessWidget {
  final String emoji;
  Movable(this.emoji);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.all(15),
        child: Text(emoji, style: TextStyle(color: Colors.black, fontSize: 60,),),
      ),
    );
  }
}
