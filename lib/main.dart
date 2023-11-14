import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '计数器应用',
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
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
        title: Text('计数器应用'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '你已经按下按钮这么多次了:',
            ),
            Text(
              '$_counter', // 这里将显示计数器的值
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // 当按钮被按下时，_incrementCounter 方法将被调用
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
    );
  }
}
