import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // 在应用程序顶层封装ChangeNotifierProvider
  runApp(
    ChangeNotifierProvider(
      // 创建一个ThemeNotifier实例
      create: (_) => ThemeNotifier(lightTheme),
      child: MyApp(),
    ),
  );
}

// 定义两种不同的主题数据
final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
);

// ThemeNotifier类用于管理应用主题的状态
class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  // 构造函数初始化当前主题为传入的主题
  ThemeNotifier(this._themeData);

  // 获取当前的主题
  ThemeData get themeData => _themeData;

  // 设置新的主题并通知听众
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // 方法用于在两种主题间切换
  void toggleTheme() {
    if (_themeData.brightness == Brightness.light) {
      themeData = darkTheme;
    } else {
      themeData = lightTheme;
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用Consumer来监听ThemeNotifier变化
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.themeData, // 应用当前主题
        home: ThemeSwitcherPage(), // 主屏幕为ThemeSwitcherPage
      ),
    );
  }
}

// 主屏幕类
class ThemeSwitcherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Switcher'), // 应用栏标题
      ),
      body: Center(
        // 居中的按钮用于切换主题
        child: ElevatedButton(
          onPressed: () =>
          // 不监听变化，只调用方法
          Provider.of<ThemeNotifier>(context, listen: false).toggleTheme(),
          child: Text('Toggle Theme'), // 按钮文本
        ),
      ),
    );
  }
}