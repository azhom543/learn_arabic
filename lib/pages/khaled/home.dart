import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kids_game_eslam/pages/hamdy/level1.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemModel> items;
  List<ItemModel> items2;
  int score;
  bool gameOver;
  final player = AudioCache();

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(
          icon: FontAwesomeIcons.appleAlt, name: "تفاح", value: "appleAlt"),
      ItemModel(icon: FontAwesomeIcons.dog, name: "كلب", value: "dog"),
      ItemModel(icon: FontAwesomeIcons.cat, name: "قطة", value: "Cat"),
      ItemModel(icon: FontAwesomeIcons.car, name: "سيارة", value: "car"),
      ItemModel(icon: FontAwesomeIcons.moon, name: "قمر", value: "moon"),
      ItemModel(icon: FontAwesomeIcons.bookOpen, name: "كتاب", value: "book"),
      ItemModel(icon: FontAwesomeIcons.pen, name: "قلم", value: "pen"),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) gameOver = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Level 2'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Score: ",
                  style: TextStyle(color: Colors.black, fontSize: 25)),
              TextSpan(
                  text: "$score",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ))
            ])),
            if (!gameOver)
              Row(
                children: <Widget>[
                  Column(
                      children: items.map((item) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Draggable<ItemModel>(
                            data: item,
                            childWhenDragging: Icon(
                              item.icon,
                              color: Colors.grey,
                              size: 50.0,
                            ),
                            feedback: Icon(
                              item.icon,
                              color: Colors.red,
                              size: 50,
                            ),
                            child: Icon(
                              item.icon,
                              color: Colors.blue,
                              size: 50,
                            ),
                          ),
                        );
                      }).toList()),
                  Spacer(),
                  Column(
                      children: items2.map((item) {
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem) {
                            if (item.value == receivedItem.value) {
                              setState(() {
                                items.remove(receivedItem);
                                items2.remove(item);
                                score += 10;
                                item.accepting = false;
                                player.play('correct.wav');
                              });
                            } else {
                              setState(() {
                                // score -= 5;
                                item.accepting = false;
                                player.play('incorrect.mp3');
                              });
                            }
                          },
                          onLeave: (receivedItem) {
                            setState(() {
                              item.accepting = false;
                            });
                          },
                          onWillAccept: (receivedItem) {
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                          },
                          builder: (context, acceptedItems, rejectedItem) =>
                              Container(
                                color: item.accepting ? Colors.green : Colors.blue,
                                height: 50,
                                width: 100,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(8.0),
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                        );
                      }).toList()),
                ],
              ),
            if (gameOver)
              Text(
                "GameOver",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            if (gameOver)
              Column(
                children: [
                  Center(
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text("New Game"),
                      onPressed: () {
                        initGame();
                        setState(() {});
                      },
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text("Next"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Level1()));
                      },
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}

class ItemModel {
  final String name;
  final String value;
  final IconData icon;
  bool accepting;

  ItemModel({this.name, this.value, this.icon, this.accepting = false});
}
