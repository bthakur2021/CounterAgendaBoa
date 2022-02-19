import 'package:counter_agenda_boa/Model/CounterModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class CounterNotifierThree extends StateNotifier<CounterModel> {
  CounterNotifierThree() : super(_initialValue);
  static const _initialValue = CounterModel(0);
  void increment() {
    state = CounterModel(state.count + 1);
  }
  void refresh()
  {
    state = CounterModel(0);
  }
}