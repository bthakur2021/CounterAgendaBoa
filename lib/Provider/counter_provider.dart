import 'package:counter_agenda_boa/AppEnum/app_enums.dart';
import 'package:counter_agenda_boa/FirebaseServices/firebase.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  final CounterType _counterType;
  late final FirebaseServices _firebaseServices;

  int counter = 0;

  CounterProvider(this._counterType) {
    _firebaseServices = FirebaseServices(_counterType);
    _firebaseServices.getCounterValue().then((value) {
      counter = value;
      notifyListeners();
    });
  }

  void increment() async {
    counter = await _firebaseServices.updateCounter(counter + 1);
    notifyListeners();
  }

  void reset() async {
    counter = await _firebaseServices.updateCounter(0);
    notifyListeners();
  }
}
