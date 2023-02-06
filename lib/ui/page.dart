import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/mobile_layout.dart';
import '../provider/selected_memo.dart';
import 'detail_memo.dart';
import 'listview_memo.dart';

import 'package:desktop_multi_window/desktop_multi_window.dart';

// ignore: must_be_immutable
class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  static const int kMobileMaxWidth = 400;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget mobileWidget() {
    return const ListViewMemo();
  }

  Widget desktopWidget() {
    return Row(
      children: [
        // list drawer
        const SizedBox(
          width: 300,
          child: ListViewMemo(),
        ),
        const VerticalDivider(width: 0),
        // detail
        Expanded(
          child: DetailMemo(
            key: ValueKey(context.watch<SelectedMemo>().selectedMemo?.hashCode),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(" AppPageState :: build");

    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        final bool mobileUi = MediaQuery.of(context).size.width < kMobileMaxWidth;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          context.read<MobileLayout>().updateMobileLayout(mobileUi);
        });
        return mobileUi? mobileWidget() : desktopWidget();
      }),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // new window test
        final window = await DesktopMultiWindow.createWindow();
        window
          ..setFrame(const Offset(0, 0) & const Size(300, 600))
          ..center()
          ..resizable(true)
          ..show();
      }),
    );
  }

}