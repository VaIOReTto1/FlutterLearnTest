import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '计数器应用',
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0; // 这是计数器的初始值

  void _incrementCounter() {
    // TODO: 在这里编写逻辑来增加计数器的值
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('计数器应用'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '你已经按下按钮这么多次了:',
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '$_counter', // 这里将显示计数器的值
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 5,
            ),
            FloatingActionButton(
              onPressed: _incrementCounter, // 当按钮被按下时，_incrementCounter 方法将被调用
              tooltip: '增加',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
