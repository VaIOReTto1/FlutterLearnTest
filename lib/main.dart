import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TODO: 定义一个布尔型状态变量来跟踪按钮是否被点击

  void _toggleButton() {
    setState(() {
      // TODO: 更新状态变量以切换文本显示
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management Demo'),
      ),
      body: Center(
        // TODO: 根据状态变量显示相应的文本
        child: Text('文本显示'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleButton,
        tooltip: 'Toggle',
        child: Icon(Icons.touch_app),
      ),
    );
  }
}
