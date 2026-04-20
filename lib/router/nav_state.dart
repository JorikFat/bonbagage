import 'package:flutter/material.dart';

class NavState extends ChangeNotifier {
  String? _selectedJourneyId;
  String? get selectedJourneyId => _selectedJourneyId;

  void goToBags(String id) {
    _selectedJourneyId = id;
    notifyListeners();
  }

  void goBack() {
    _selectedJourneyId = null;
    notifyListeners();
  }
}