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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("状态管理"),
      ),
      body: const Center(
        child: LikeIcon(),
      ),
    );
  }
}

class LikeIcon extends StatefulWidget {
  const LikeIcon({Key? key}) : super(key: key);

  @override
  State<LikeIcon> createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  bool ok = false; // true代表点赞，false代表没点赞

  clickFunc() {
    // 使用State类提供的setState函数来刷新Widget状态
    setState(() {
      ok = !ok;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => clickFunc(),
        child: Icon(
          Icons.thumb_up,
          color: ok ? Colors.blue : Colors.grey,
        ));
  }
}