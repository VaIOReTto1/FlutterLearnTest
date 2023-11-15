import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Column(
        children: [
          // TODO: 实现显示 Todo 列表的 Widget

          // TODO: 实现添加新 Todo 的 Widget
        ],
      ),
    );
  }
}

class TodoModel {
  String title;
  bool isDone;

  TodoModel({required this.title, this.isDone = false});

// TODO: 添加方法来切换任务的完成状态

}

class TodosProvider extends ChangeNotifier {
  List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

// TODO: 实现添加 Todo 的方法

// TODO: 实现切换 Todo 完成状态的方法

// 当添加或修改 Todo 时，调用 notifyListeners() 来通知监听者
}
