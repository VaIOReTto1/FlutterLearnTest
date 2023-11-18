import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OneAdd(),
    );
  }
}

class OneAdd extends StatefulWidget {
  const OneAdd({super.key});

  @override
  State<OneAdd> createState() => _OneAddState();
}

class _OneAddState extends State<OneAdd> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text(
              '你的变量已经赋值了',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TwoAdd(
              counter: counter,
              twoIncrement: (){
                setState(() {
                  counter+=2;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TwoAdd extends StatelessWidget {
  final int counter;
  final VoidCallback twoIncrement;
  const TwoAdd({super.key, required this.counter, required this.twoIncrement});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            '点击下方按钮为变量赋值加二',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$counter',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: twoIncrement,
            child: const Text('点击'),
          ),
        ],
      ),
    );
  }
}
