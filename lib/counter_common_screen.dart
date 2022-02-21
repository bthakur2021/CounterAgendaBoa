import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Provider/counter_provider.dart';

class CounterCommonScreen extends StatefulHookConsumerWidget {
  final CounterProvider provider;

  const CounterCommonScreen({required this.provider, Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _CounterOneScreenState createState() => _CounterOneScreenState(provider: provider);
}

class _CounterOneScreenState extends ConsumerState<CounterCommonScreen> {
  final CounterProvider provider;

  _CounterOneScreenState({required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.increment();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.plus_one),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(200.0),
                ),
                child: Center(
                  child: Text(
                    '${provider.counter}',
                    style: const TextStyle(fontSize: 80, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
