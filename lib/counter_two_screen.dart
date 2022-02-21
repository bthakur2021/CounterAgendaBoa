import 'package:counter_agenda_boa/FirebaseServices/firebase.dart';
import 'package:counter_agenda_boa/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterTwoScreen extends StatefulHookWidget
  {
  const CounterTwoScreen({Key? key}) : super(key: key);


  @override
  _CounterTwoScreenState createState() => _CounterTwoScreenState();
}

class _CounterTwoScreenState extends State<CounterTwoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseServices.getData();
  }

  @override
  Widget build(BuildContext context) {
    final counterModel = useProvider(provider2);
    int counterValue = counterModel.count;
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter Value is here : $counterValue ",
            style: const TextStyle(fontSize: 16),),
          const SizedBox(height: 20.0),
          ElevatedButton.icon(
            onPressed: () {
              context.read(provider2.notifier).increment();
              FirebaseServices.updateCounter2(counterValue + 1);
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
