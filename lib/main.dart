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
      appBar: AppBar(title: const Text('Todo List')),
      body: Column(
        children: [
          Expanded(
            // Todo 列表的构建函数
            child: Consumer<TodosProvider>(
              builder: (context, todosProvider, child) {
                return ListView.builder(
                  itemCount: todosProvider.todos.length,
                  itemBuilder: (context, index) {
                    var todo = todosProvider.todos[index];
                    return ListTile(
                      title: Text(todo.title),
                      trailing: Checkbox(
                        value: todo.isDone,
                        // TODO: 实现切换 Todo 完成状态的回调函数
                        onChanged: null,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // TODO: 实现添加 Todo 的回调函数
            },
          ),
        ],
      ),
    );
  }
}

class TodoModel {
  String title; // 任务标题
  bool isDone; // 是否完成

  TodoModel({required this.title, this.isDone = false});

// TODO: 添加方法来切换任务的完成状态
}

class TodosProvider extends ChangeNotifier {
  List<TodoModel> _todos = []; // 任务列表

  List<TodoModel> get todos => _todos;

// TODO: 实现添加 Todo 的方法

// TODO: 实现切换 Todo 完成状态的方法

// 当添加或修改 Todo 时，调用 notifyListeners() 来通知监听者
}
