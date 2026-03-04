import 'dart:developer' as developer;
import 'package:flutter/material.dart';

void main() {
  runApp(const BolcApp());
}

class BolcApp extends StatelessWidget {
  const BolcApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
      developer.log('Counter incremented to: $_counter');
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 1;
      developer.log('Counter reset to: 1');
    });
  }

  bool _isBolc() {
    // if the counter is 3, can be devided by 3 or contains 3 the player should say "bolc"
    return _counter % 3 == 0 || _counter.toString().contains('3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: _isBolc() ? Colors.red : Colors.green,
      body: GestureDetector(
        onTap: _incrementCounter,
        behavior: HitTestBehavior.opaque,
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have tapped the screen this many times:'),
              Text(
                _isBolc() ? '$_counter (bolc)' : '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetCounter,
                child: const Text('Reset Counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
