import 'package:domain/domain.dart';

enum CharactersSortType {
  byDefault,
  byName,
  byBirthDay,
  aliveFirst,
  deadFirst;

  String get name {
    switch (this) {
      case byDefault:
        return 'By default';
      case byName:
        return 'By name';
      case byBirthDay:
        return 'By birthday';
      case aliveFirst:
        return 'Alive first';
      case deadFirst:
        return 'Dead first';
    }
  }

  List<CharacterEntity> sortList(List<CharacterEntity> characters) {
    final list = List<CharacterEntity>.from(characters);
    list.sort(compare);
    return list;
  }

  int compare(CharacterEntity a, CharacterEntity b) {
    switch (this) {
      case byDefault:
        return 0;
      case byName:
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      case byBirthDay:
        return _parseDate(a.created).compareTo(_parseDate(b.created));
      case aliveFirst:
        return _statusPriority(b.status).compareTo(_statusPriority(a.status));
      case deadFirst:
        return _statusPriority(a.status).compareTo(_statusPriority(b.status));
    }
  }

  static DateTime _parseDate(String date) {
    try {
      return DateTime.parse(date);
    } catch (_) {
      return DateTime(1970);
    }
  }

  static int _statusPriority(String status) {
    return switch (status) {
      'Alive' => 2,
      'Dead' => 1,
      _ => 0,
    };
  }
}
