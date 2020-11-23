import 'package:destini_challenge_starting/story.dart';
import 'option.dart';

class StoryBrain {
  _Plan _plan;

  StoryBrain() {
    List<Story> storyData = [
      Story(title: 'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
          options: {
            Option.FirstOption: 'I\'ll hop in. Thanks for the help!',
            Option.SecondOption: 'Better ask him if he\'s a murderer first.'
          }),
      Story(title: 'He nods slowly, unphased by the question.',
          options: {
            Option.FirstOption: 'At least he\'s honest. I\'ll climb in.',
            Option.SecondOption: 'Wait, I know how to change a tire.'
          }),
      Story(title: 'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
          options: {
            Option.FirstOption: 'I love Elton John! Hand him the cassette tape.',
            Option.SecondOption: 'It\'s him or me! You take the knife and stab him.'
          }),
      Story(title: 'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
          options: {Option.FirstOption: 'Restart', Option.SecondOption: ''}),
      Story(title: 'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
          options: {Option.FirstOption: 'Restart', Option.SecondOption: ''}),
      Story(title: 'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
          options: {Option.FirstOption: 'Restart', Option.SecondOption: ''})
    ];

    _Node commonPath = _Node(storyData[2], {
      Option.FirstOption: _Node(storyData[5]),
      Option.SecondOption: _Node(storyData[4])
    });
    _plan = _Plan(_Node(storyData[0], {
      Option.FirstOption: commonPath,
      Option.SecondOption: _Node(storyData[1], {
        Option.FirstOption: commonPath,
        Option.SecondOption: _Node(storyData[3])
      })
    }));
  }

  String getStory() {
    return _plan.current.story.title;
  }

  String getChoice(Option choice) {
    return _plan.current.story.getChoice(choice);
  }

  void nextStory(Option choice) {
    if (_plan.isFinal(choice)) {
      _plan.restart();
    } else {
      _plan.move(choice);
    }
  }

  bool buttonShouldBeVisible(Option choice) {
    var currentChoice = getChoice(choice);
    return currentChoice != null && currentChoice.isNotEmpty;
  }
}

class _Plan {
  _Node root;
  _Node current;

  _Plan(_Node root) {
    this.root = root;
    current = root;
  }

  bool isFinal(Option next) {
    return current.paths == null || current.paths[next] == null;
  }

  void move(Option choice) {
    current = current.paths[choice];
  }

  void restart() {
    current = root;
  }
}

class _Node {
  final Story story;
  Map<Option, _Node> paths;

  _Node(this.story, [this.paths]);
}
