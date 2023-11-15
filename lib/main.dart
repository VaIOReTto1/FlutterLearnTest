import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Dynamic Form Validation',
      home: DynamicFormValidation(),
    );
  }
}

class DynamicFormValidation extends StatefulWidget {
  const DynamicFormValidation({super.key});

  @override
  _DynamicFormValidationState createState() => _DynamicFormValidationState();
}

class _DynamicFormValidationState extends State<DynamicFormValidation> {
  late TextEditingController textController;
  late bool isButtonEnabled;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    isButtonEnabled = false;

    // TODO: 为文本框添加监听器，当文本框内容发生变化时，更新按钮状态
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('任务清单'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: '输入文本',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: isButtonEnabled
                ? () {
                    // TODO: 有文本时，提交表单
                  }
                : null,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
