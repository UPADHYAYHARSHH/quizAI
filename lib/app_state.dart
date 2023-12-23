import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz/questionOptionStructure.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _generatedQuiz = [];

  List<String> get generatedQuiz => _generatedQuiz;

  set generatedQuiz(List<String> value) {
    _generatedQuiz = value;
  }

  void addToGeneratedQuiz(String value) {
    _generatedQuiz.add(value);
  }

  void removeFromGeneratedQuiz(String value) {
    _generatedQuiz.remove(value);
  }

  void removeAtIndexFromGeneratedQuiz(int index) {
    _generatedQuiz.removeAt(index);
  }

  void updateGeneratedQuizAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _generatedQuiz[index] = updateFn(_generatedQuiz[index]);
  }

  void insertAtIndexInGeneratedQuiz(int index, String value) {
    _generatedQuiz.insert(index, value);
  }

  List<String> _generatedOptions = [];

  List<String> get generatedOptions => _generatedOptions;

  set generatedOptions(List<String> value) {
    _generatedOptions = value;
  }

  void addToGeneratedOptions(String value) {
    _generatedOptions.add(value);
  }

  void removeFromGeneratedOptions(String value) {
    _generatedOptions.remove(value);
  }

  void removeAtIndexFromGeneratedOptions(int index) {
    _generatedOptions.removeAt(index);
  }

  void updateGeneratedOptionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _generatedOptions[index] = updateFn(_generatedOptions[index]);
  }

  void insertAtIndexInGeneratedOptions(int index, String value) {
    _generatedOptions.insert(index, value);
  }

  List<dynamic> _mapData = [];

  List<dynamic> get mapData => _mapData;

  set mapData(List<dynamic> value) {
    _mapData = value;
  }

  void addToMapData(dynamic value) {
    _mapData.add(value);
  }

  void removeFromMapData(dynamic value) {
    _mapData.remove(value);
  }

  void removeAtIndexFromMapData(int index) {
    _mapData.removeAt(index);
  }

  void updateMapDataAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _mapData[index] = updateFn(_mapData[index]);
  }

  void insertAtIndexInMapData(int index, dynamic value) {
    _mapData.insert(index, value);
  }

  dynamic _key =
      jsonDecode('{"question":"Question","option":"Option","answer":"Answer"}');

  dynamic get key => _key;

  set key(dynamic value) {
    _key = value;
  }

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int value) {
    _pageIndex = value;
  }

  String _inviteCode = '';

  String get inviteCode => _inviteCode;

  set inviteCode(String value) {
    _inviteCode = value;
  }

  String _selectedLanguage = 'English';

  String get selectedLanguage => _selectedLanguage;

  set selectedLanguage(String value) {
    _selectedLanguage = value;
  }

  List<QuestionOptionStructure> _questionOptionAnswer = [];

  List<QuestionOptionStructure> get questionOptionAnswer =>
      _questionOptionAnswer;

  set questionOptionAnswer(List<QuestionOptionStructure> value) {
    _questionOptionAnswer = value;
  }

  bool _isEdit = false;

  bool get isEdit => _isEdit;

  set isEdit(bool value) {
    _isEdit = value;
  }

  bool _isMultiple = true;

  bool get isMultiple => _isMultiple;

  set isMultiple(bool value) {
    _isMultiple = value;
  }

  String _topicName = '';

  String get topicName => _topicName;

  set topicName(String value) {
    _topicName = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
