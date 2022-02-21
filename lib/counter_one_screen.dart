import 'package:counter_agenda_boa/Provider/provider_utils.dart';
import 'package:counter_agenda_boa/counter_common_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterOneScreen extends HookConsumerWidget {
  const CounterOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counterProvider = ref.watch(providerCounter1);
    return CounterCommonScreen(provider: counterProvider);
  }
}
