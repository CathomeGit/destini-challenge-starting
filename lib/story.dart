class Story {
  String _title;
  String _option1;
  String _option2;

  Story({String storyTitle, String choice1, String choice2}) {
    _title = storyTitle;
    _option1 = choice1;
    _option2 = choice2;
  }

  String get option2 => _option2;

  String get option1 => _option1;

  String get title => _title;
}
