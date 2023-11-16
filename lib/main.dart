import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Scroll Listener Example',
      home: ScrollListenerExample(),
    );
  }
}

class ScrollListenerExample extends StatefulWidget {
  const ScrollListenerExample({super.key});

  @override
  _ScrollListenerExampleState createState() => _ScrollListenerExampleState();
}

class _ScrollListenerExampleState extends State<ScrollListenerExample> {
  final ScrollController _scrollController = ScrollController();
  double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      _offset = _scrollController.offset;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll Listener Example'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item$index'));
        },
      ),
      bottomNavigationBar: Text('Scroll Offset: $_offset'),
    );
  }
}