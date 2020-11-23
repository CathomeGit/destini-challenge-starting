import 'option.dart';

class Story {
  String _title;
  Map<Option, String> _options;

  Story({String title, Map<Option, String> options}) {
    _title = title;
    _options = options;
  }

  String getChoice(Option choice) {
    return _options[choice];
  }

  String get title => _title;
}
