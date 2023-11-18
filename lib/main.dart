import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(), body: const ExpandedContanier(ExpandedContent: ExpandedContent(),ExpandedTitle: ExpandedTitle(),)),
    );
  }
}

class ExpandedContanier extends StatefulWidget {
  final Widget ExpandedContent;
  final Widget ExpandedTitle;
  const ExpandedContanier({super.key,required this.ExpandedContent, required this.ExpandedTitle});

  @override
  State<ExpandedContanier> createState() => _ExpandedContanierState();
}

class _ExpandedContanierState extends State<ExpandedContanier> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 使用MainAxisSize.min
          children: [
            Row(
              children: [
               widget.ExpandedTitle,
                Expanded(child: Container()),
                InkWell(
                  child: Icon(_isExpanded
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down_outlined),
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                )
              ],
            ),
            Visibility(
              visible: _isExpanded, // 根据_isExpanded的值显示或隐藏
              child: widget.ExpandedContent,
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedTitle extends StatelessWidget {
  const ExpandedTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 50,
      child: const Row(
        children: [
          Icon(Icons.person),
          SizedBox(
            width: 8,
          ),
          Text(
            "个性化",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


class ExpandedContent extends StatelessWidget {
  const ExpandedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("更多信息"),
                  Expanded(child: Container()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("更多信息"),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
