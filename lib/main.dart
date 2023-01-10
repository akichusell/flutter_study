import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/ui/list_item.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter/material.dart';

import 'data/memo_data.dart';

void main() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    // WidgetsFlutterBinding.ensureInitialized();
    // setWindowMinSize(const Size(300, 600));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MemoData> dataList = <MemoData>[
    MemoData(
      title:"title 1",
      content:"content 1"
    ),
    MemoData(
      title: "title 2",
      content: "content 2"
    ),
    MemoData(
        title: "title 3",
        content: "content 3"
    ),
    MemoData(
        title: "title 4",
        content: "content 4"
    ),
  ];

  void appendData() {
    setState(() {
      dataList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListItem(memoData:dataList[index]);
        },
      ),
    );
  }
}
