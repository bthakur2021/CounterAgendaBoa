import 'package:counter_agenda_boa/FirebaseServices/firebase.dart';
import 'package:counter_agenda_boa/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterOneScreen extends StatefulHookWidget {
  const CounterOneScreen({Key? key}) : super(key: key);

  @override
  _CounterOneScreenState createState() => _CounterOneScreenState();
}

class _CounterOneScreenState extends State<CounterOneScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseServices.getData();
  }

  @override
  Widget build(BuildContext context) {
    final counterModel = useProvider(provider);
    int counterValue = counterModel.count;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(200.0),
                      ),
                      child: Center(
                        child: Text(
                          '$counterValue',
                          style: const TextStyle(fontSize: 80,color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Counter Value is here",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(200.0),
                      ),
                      child: Center(
                        child: Text(
                          "${FirebaseServices.updatedValue}",
                          style: const TextStyle(fontSize: 80,color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Firebase Counter Value is here",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            //    Text("Counter Value is here : $counterValue ",style: const TextStyle(fontSize: 16),),
            //  Text("Firebase Counter Value is here : ${FirebaseServices.updatedValue} ",style: const TextStyle(fontSize: 16),),

            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                context.read(provider.notifier).increment();
                FirebaseServices.updateCounter1(counterValue + 1);
                FirebaseServices.getData();
                // Respond to button press
              },
              icon: const Icon(Icons.add, size: 18),
              label: const Text("Increment me !"),
            )
          ],
        ),
      ),
    );
  }
}
