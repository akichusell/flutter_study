import 'package:flutter/material.dart';
import 'package:flutter_study/provider/mobile_layout.dart';
import 'package:provider/provider.dart';

import 'provider/selected_memo.dart';
import 'ui/page.dart';

void main() {
  // if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   setWindowMinSize(const Size(300, 600));
  // }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => SelectedMemo(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => MobileLayout(),
        ),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("MyApp :: build");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppPage(),
    );
  }
}