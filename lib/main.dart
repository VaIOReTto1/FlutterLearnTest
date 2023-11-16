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
      body: Center(
        child: IconButton(
          icon: Icon(Icons.chevron_right),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyStatePage()));
          },
        ),
      ),
    );
  }
}


class MyStatePage extends StatefulWidget {
  const MyStatePage({Key? key}) : super(key: key);

  @override
  State<MyStatePage> createState() => _MyStatePageState();
}

class _MyStatePageState extends State<MyStatePage> {


  @override
  void initState() {
    super.initState();
    print("初始化：initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("依赖变化：didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("构建页面：build");
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: IconButton(
          onPressed: () {
            print("调用setState重新build");
            setState(() {});
          },
          icon: Icon(Icons.ac_unit,),
        ),
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    print("热重载被调用，用于调试：reassemble");
  }

  @override
  void didUpdateWidget(MyStatePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("组件被重新构建：didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("组件被移除节点：deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("永久移除组件：dispose");
  }
}