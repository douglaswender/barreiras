import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<String> names = ObservableList.of([]);

  @observable
  ObservableList<List<String>> history = ObservableList.of([]);

  @observable
  int numberOfPlayers = 3;

  @observable
  int maxWinStreak = 3;

  @observable
  int winStreak = 0;

  @action
  Future<void> loadLocal() async {
    final prefs = await SharedPreferences.getInstance();
    List decoded = jsonDecode(prefs.getString('local') ?? '');
    names = ObservableList.of([...decoded]);
  }

  @action
  Future<bool> addName(String name) async {
    history.add(names.toList());

    if (!names.contains(name)) {
      names.add(name);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('local', jsonEncode(names));
      return true;
    } else {
      return false;
    }
  }

  @action
  Future<void> removeName(String name) async {
    history.add(names.toList());
    names.remove(name);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('local', jsonEncode(names));
  }

  @action
  void setNumberOfPlayers(String value) {
    numberOfPlayers = int.parse(value);
    names.add('test');
    names.remove('test');
  }

  @action
  void setMaxWinStreak(String value) {
    maxWinStreak = int.parse(value);
    names.add('test');
    names.remove('test');
  }

  @action
  Future<void> allTeamOut() async {
    history.add(names.toList());
    winStreak = 0;
    List<String> allTeam = names.getRange(0, numberOfPlayers * 2).toList();

    for (var element in allTeam) {
      names.remove(element);
    }
    allTeam.shuffle();
    for (var element in allTeam) {
      names.add(element);
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('local', jsonEncode(names));
  }

  @action
  Future<void> blueTeamOut() async {
    history.add(names.toList());
    winStreak = 1;
    List<String> blueTeam = names.getRange(0, numberOfPlayers).toList();

    for (var element in blueTeam) {
      names.remove(element);
    }
    blueTeam.shuffle();
    for (var element in blueTeam) {
      names.add(element);
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('local', jsonEncode(names));
  }

  @action
  Future<void> greenTeamOut() async {
    history.add(names.toList());
    winStreak++;
    List<String> greenTeam =
        names.getRange(numberOfPlayers, numberOfPlayers * 2).toList();

    for (var element in greenTeam) {
      names.remove(element);
    }
    greenTeam.shuffle();
    for (var element in greenTeam) {
      names.add(element);
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('local', jsonEncode(names));
  }

  @action
  Future<bool> updatePlayer(String text, int index) async {
    if (!names.contains(text)) {
      history.add(names.toList());
      names[index] = text;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('local', jsonEncode(names));
      return true;
    } else {
      return false;
    }
  }

  @action
  Future<void> shuffleOthers() async {
    history.add(names.toList());
    List<String> others = names.sublist(numberOfPlayers * 2);
    for (var element in others) {
      names.remove(element);
    }

    others.shuffle();
    for (var element in others) {
      names.add(element);
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('local', jsonEncode(names));
  }

  @action
  Future<void> shuffleAll() async {
    history.add(names.toList());
    names.shuffle();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('local', jsonEncode(names));
  }

  @action
  Future<void> removeAll() async {
    history.add(names.toList());
    names.clear();
    winStreak = 0;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('local', jsonEncode(names));
  }

  @action
  Future<void> loadLastHistory() async {
    names = ObservableList.of([...history[history.length - 1]]);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('local', jsonEncode(names));
    history.removeLast();
  }
}
