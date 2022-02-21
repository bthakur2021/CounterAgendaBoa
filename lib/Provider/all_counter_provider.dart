import 'package:counter_agenda_boa/AppEnum/app_enums.dart';
import 'package:counter_agenda_boa/FirebaseServices/firebase.dart';
import 'package:flutter/material.dart';

import 'counter_provider.dart';

class AllCounterProvider extends ChangeNotifier {

  CounterProvider counterProvider1;
  CounterProvider counterProvider2;
  CounterProvider counterProvider3;

  AllCounterProvider({required this.counterProvider1, required this.counterProvider2, required this.counterProvider3,});

  void reset() async {
    counterProvider1.reset();
    counterProvider2.reset();
    counterProvider3.reset();
    notifyListeners();
  }
}
