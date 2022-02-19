import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_agenda_boa/FirebaseServices/firebase.dart';
import 'package:counter_agenda_boa/Provider/counterProviderOne.dart';
import 'package:counter_agenda_boa/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterOneScreen extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final counterModel = useProvider(provider);
    int counterValue = counterModel.count;
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter Value is here : $counterValue ",style: TextStyle(fontSize: 16),),
          Text("Firebase Counter Value is here : ${FirebaseServices.updatedValue} ",style: TextStyle(fontSize: 16),),

          const SizedBox(height: 20.0),
          ElevatedButton.icon(
            onPressed: () {
              context.read(provider.notifier).increment();
              FirebaseServices.updateCounter1(counterValue+1);
              FirebaseServices.getData();
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

