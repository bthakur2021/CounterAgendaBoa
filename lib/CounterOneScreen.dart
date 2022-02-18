import 'package:counter_agenda_boa/Provider/counterProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterOneScreen extends HookWidget {
  CounterOneScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(CounterNotifier());
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Counter Value will be here : ",style: TextStyle(fontSize: 10),),
          const SizedBox(height: 20.0),
          ElevatedButton.icon(
            onPressed: () {

              // Respond to button press
            },
            icon: const Icon(Icons.add, size: 18),
            label: const Text("Increment me !"),
          )
        ],
      ),
    );
  }
}

class _CounterOneScreenState extends State<CounterOneScreen > {

  @override
}

