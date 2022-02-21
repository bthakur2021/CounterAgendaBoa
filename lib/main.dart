import 'package:counter_agenda_boa/counter_two_screen.dart';
import 'package:counter_agenda_boa/counter_three_screen.dart';
import 'package:counter_agenda_boa/FirebaseServices/firebase.dart';
import 'package:counter_agenda_boa/Model/CounterModel.dart';
import 'package:counter_agenda_boa/Provider/counterProviderOne.dart';
import 'package:counter_agenda_boa/Provider/counterProviderThree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'counter_one_screen.dart';
import 'Provider/counterProviderTwo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

final provider = StateNotifierProvider<CounterNotifierOne, CounterModel>(
      (ref) => CounterNotifierOne(),
);
final provider2 = StateNotifierProvider<CounterNotifierTwo, CounterModel>(
      (ref) => CounterNotifierTwo(),
);
final provider3 = StateNotifierProvider<CounterNotifierThree, CounterModel>(
      (ref) => CounterNotifierThree(),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyNavigationBar(),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar ({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {

  int _selectedIndex = 0;
  int selectedPage = 0;

  final _pageOptions = [
    const CounterOneScreen(),
    const CounterTwoScreen(),
    const CounterThreeScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

@override
void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseServices.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Counter Agenda Boa'),
          backgroundColor: Colors.black
      ),
      body: _pageOptions[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
        FirebaseServices.refreshAllCounter(0);
        context.read(provider.notifier).refresh();
        context.read(provider2.notifier).refresh();
        context.read(provider3.notifier).refresh();

        },
        tooltip: 'Increment',
        child: const Icon(Icons.delete_forever),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.countertops),
                title: Text('Counter 1'),
                backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.countertops_outlined),
                title: Text('Counter 2'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.countertops_rounded),
              title: Text('Counter 3'),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}

