// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$namesAtom = Atom(name: '_HomeStoreBase.names', context: context);

  @override
  ObservableList<String> get names {
    _$namesAtom.reportRead();
    return super.names;
  }

  @override
  set names(ObservableList<String> value) {
    _$namesAtom.reportWrite(value, super.names, () {
      super.names = value;
    });
  }

  late final _$historyAtom =
      Atom(name: '_HomeStoreBase.history', context: context);

  @override
  ObservableList<List<String>> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<List<String>> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$numberOfPlayersAtom =
      Atom(name: '_HomeStoreBase.numberOfPlayers', context: context);

  @override
  int get numberOfPlayers {
    _$numberOfPlayersAtom.reportRead();
    return super.numberOfPlayers;
  }

  @override
  set numberOfPlayers(int value) {
    _$numberOfPlayersAtom.reportWrite(value, super.numberOfPlayers, () {
      super.numberOfPlayers = value;
    });
  }

  late final _$maxWinStreakAtom =
      Atom(name: '_HomeStoreBase.maxWinStreak', context: context);

  @override
  int get maxWinStreak {
    _$maxWinStreakAtom.reportRead();
    return super.maxWinStreak;
  }

  @override
  set maxWinStreak(int value) {
    _$maxWinStreakAtom.reportWrite(value, super.maxWinStreak, () {
      super.maxWinStreak = value;
    });
  }

  late final _$winStreakAtom =
      Atom(name: '_HomeStoreBase.winStreak', context: context);

  @override
  int get winStreak {
    _$winStreakAtom.reportRead();
    return super.winStreak;
  }

  @override
  set winStreak(int value) {
    _$winStreakAtom.reportWrite(value, super.winStreak, () {
      super.winStreak = value;
    });
  }

  late final _$loadLocalAsyncAction =
      AsyncAction('_HomeStoreBase.loadLocal', context: context);

  @override
  Future<void> loadLocal() {
    return _$loadLocalAsyncAction.run(() => super.loadLocal());
  }

  late final _$addNameAsyncAction =
      AsyncAction('_HomeStoreBase.addName', context: context);

  @override
  Future<bool> addName(String name) {
    return _$addNameAsyncAction.run(() => super.addName(name));
  }

  late final _$removeNameAsyncAction =
      AsyncAction('_HomeStoreBase.removeName', context: context);

  @override
  Future<void> removeName(String name) {
    return _$removeNameAsyncAction.run(() => super.removeName(name));
  }

  late final _$allTeamOutAsyncAction =
      AsyncAction('_HomeStoreBase.allTeamOut', context: context);

  @override
  Future<void> allTeamOut() {
    return _$allTeamOutAsyncAction.run(() => super.allTeamOut());
  }

  late final _$blueTeamOutAsyncAction =
      AsyncAction('_HomeStoreBase.blueTeamOut', context: context);

  @override
  Future<void> blueTeamOut() {
    return _$blueTeamOutAsyncAction.run(() => super.blueTeamOut());
  }

  late final _$greenTeamOutAsyncAction =
      AsyncAction('_HomeStoreBase.greenTeamOut', context: context);

  @override
  Future<void> greenTeamOut() {
    return _$greenTeamOutAsyncAction.run(() => super.greenTeamOut());
  }

  late final _$updatePlayerAsyncAction =
      AsyncAction('_HomeStoreBase.updatePlayer', context: context);

  @override
  Future<bool> updatePlayer(String text, int index) {
    return _$updatePlayerAsyncAction.run(() => super.updatePlayer(text, index));
  }

  late final _$shuffleOthersAsyncAction =
      AsyncAction('_HomeStoreBase.shuffleOthers', context: context);

  @override
  Future<void> shuffleOthers() {
    return _$shuffleOthersAsyncAction.run(() => super.shuffleOthers());
  }

  late final _$shuffleAllAsyncAction =
      AsyncAction('_HomeStoreBase.shuffleAll', context: context);

  @override
  Future<void> shuffleAll() {
    return _$shuffleAllAsyncAction.run(() => super.shuffleAll());
  }

  late final _$removeAllAsyncAction =
      AsyncAction('_HomeStoreBase.removeAll', context: context);

  @override
  Future<void> removeAll() {
    return _$removeAllAsyncAction.run(() => super.removeAll());
  }

  late final _$loadLastHistoryAsyncAction =
      AsyncAction('_HomeStoreBase.loadLastHistory', context: context);

  @override
  Future<void> loadLastHistory() {
    return _$loadLastHistoryAsyncAction.run(() => super.loadLastHistory());
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void setNumberOfPlayers(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setNumberOfPlayers');
    try {
      return super.setNumberOfPlayers(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxWinStreak(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setMaxWinStreak');
    try {
      return super.setMaxWinStreak(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
names: ${names},
history: ${history},
numberOfPlayers: ${numberOfPlayers},
maxWinStreak: ${maxWinStreak},
winStreak: ${winStreak}
    ''';
  }
}
