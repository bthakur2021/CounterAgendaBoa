import 'package:counter_agenda_boa/Provider/provider_utils.dart';
import 'package:counter_agenda_boa/counter_common_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterTwoScreen extends HookConsumerWidget {
  const CounterTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counterProvider = ref.watch(providerCounter2);
    return CounterCommonScreen(provider: counterProvider);
  }
}
