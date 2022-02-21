import 'package:counter_agenda_boa/counter_three_screen.dart';
import 'package:counter_agenda_boa/counter_two_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Provider/provider_utils.dart';
import 'counter_one_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  final _pageOptions = [const CounterOneScreen(), const CounterTwoScreen(), const CounterThreeScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _allCounterProvider = ref.watch(providerCounterAll);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter ${_selectedIndex + 1}'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                _allCounterProvider.reset();
              },
              icon: const Icon(Icons.clear)),
        ],
      ),
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.one_k), label: 'Counter 1', backgroundColor: Colors.black),
            BottomNavigationBarItem(icon: Icon(Icons.two_k), label: 'Counter 2', backgroundColor: Colors.black),
            BottomNavigationBarItem(icon: Icon(Icons.three_k), label: 'Counter 3', backgroundColor: Colors.black),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
