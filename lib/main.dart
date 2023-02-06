import 'package:flutter/material.dart';
import 'package:flutter_study/provider/mobile_layout.dart';
import 'package:provider/provider.dart';

import 'data/memo_database.dart';
import 'provider/selected_memo.dart';
import 'ui/page.dart';

import 'package:desktop_multi_window/desktop_multi_window.dart';

void main(List<String> args) {
  // if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   setWindowMinSize(const Size(300, 600));
  // }
  if (args.isNotEmpty && args.first == 'multi_window') {
    final windowId = int.parse(args[1]);
    runApp(MultipleWindow(
      windowController: WindowController.fromWindowId(windowId),
    ));
  } else {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => SelectedMemo(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => MobileLayout(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => MemoDatabase(),
          ),
        ],
        child: const MyApp()
      )
    );
  }
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
      home: const AppPage(),
    );
  }
}

class MultipleWindow extends StatelessWidget {
  const MultipleWindow({
    Key? key,
    required this.windowController,
  }) : super(key: key);

  final WindowController windowController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () async {
                windowController.close();
              },
              child: const Text('Close this window'),
            ),
            // Expanded(child: EventWidget(controller: WindowController.fromWindowId(0)),),
          ],
        ),
      ),
    );
  }
}