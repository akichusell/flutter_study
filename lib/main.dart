import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/selected_memo.dart';
import 'ui/page.dart';

void main() {
  // if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   setWindowMinSize(const Size(300, 600));
  // }
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => SelectedMemo(),
      child: const MyApp()
    )
  );
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
      home: Scaffold(
        body: AppPage(),
      ),
    );
  }
}