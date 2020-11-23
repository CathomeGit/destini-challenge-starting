import 'package:destini_challenge_starting/story.dart';

class StoryBrain {
  _StoryPlan _storyPlan;
  int _storyNumber = 0;
  List<Story> _storyData = [
    Story(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  StoryBrain() {
    _Node commonPath = _Node(2, _Node(5, null, null), _Node(4, null, null));
    _storyPlan = _StoryPlan(
        _Node(0, commonPath, _Node(1, commonPath, _Node(3, null, null))));
  }

  String getStory() {
    return _storyData[_storyNumber].title;
  }

  String getChoice1() {
    return _storyData[_storyNumber].option1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].option2;
  }

  void nextStory(int choiceNumber) {
    bool first = choiceNumber == 1 ? true : false;
    if (_storyPlan.isEnd(first)) {
      restart();
    } else {
      _storyPlan.move(first);
    }
    _storyNumber = _storyPlan.current.value;
  }

  void restart() {
    _storyPlan.restart();
  }

  bool buttonShouldBeVisible() {
    return getChoice2().isNotEmpty;
  }
}

class _StoryPlan {
  _Node root;
  _Node current;

  _StoryPlan(_Node root) {
    this.root = root;
    current = root;
  }

  bool isEnd(bool first) {
    return first ? current.first == null : current.second == null;
  }

  void move(bool first) {
    current = first ? current.first : current.second;
  }

  void restart() {
    current = root;
  }
}

class _Node {
  final int value;
  _Node first;
  _Node second;

  _Node(this.value, this.first, this.second);
}
