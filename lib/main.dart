import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  // 在应用程序的顶层创建一个Provider对象，并将其提供给整个应用程序
  runApp(ChangeNotifierProvider(
    create: (_) => Counter(),
    child: MaterialApp(
      home: MyApp(),
    ),
  ));
}

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyHomePage build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 1
            Text('Using Provider.of'),
            Text(
              '${Provider.of<Counter>(context).count}',
              style: Theme.of(context).textTheme.headline4,
            ),

            // 2
            Text('Using Consumer'),
            Consumer<Counter>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}