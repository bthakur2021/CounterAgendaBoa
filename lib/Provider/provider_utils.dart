import 'package:counter_agenda_boa/AppEnum/app_enums.dart';
import 'package:counter_agenda_boa/Provider/all_counter_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'counter_provider.dart';

class ProviderUtils {}

final providerCounterAll = ChangeNotifierProvider<AllCounterProvider>((ref) {
  var counterProvider1 = ref.read(providerCounter1);
  var counterProvider2 = ref.read(providerCounter2);
  var counterProvider3 = ref.read(providerCounter3);

  return AllCounterProvider(
      counterProvider1: counterProvider1, counterProvider2: counterProvider2, counterProvider3: counterProvider3);
});

final providerCounter1 = ChangeNotifierProvider<CounterProvider>(
  (ref) => CounterProvider(CounterType.counter1),
);

final providerCounter2 = ChangeNotifierProvider<CounterProvider>(
  (ref) => CounterProvider(CounterType.counter2),
);

final providerCounter3 = ChangeNotifierProvider<CounterProvider>(
  (ref) => CounterProvider(CounterType.counter3),
);
