import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';
import 'option.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain _storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    _storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              buildButton(Option.FirstOption, Colors.red),
              SizedBox(
                height: 20.0,
              ),
              buildButton(Option.SecondOption, Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildButton(Option choice, Color color) {
    return Expanded(
      flex: 2,
      child: Visibility(
        visible: _storyBrain.buttonShouldBeVisible(choice),
        child: FlatButton(
          onPressed: () {
            setState(() {
              _storyBrain.nextStory(choice);
            });
          },
          color: color,
          child: Text(
            _storyBrain.getChoice(choice),
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
