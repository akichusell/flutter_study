import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/memo_database.dart';
import '../provider/mobile_layout.dart';
import '../provider/selected_memo.dart';
import 'detail_memo.dart';
import 'listview_memo.dart';

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
    return ListViewMemo(dataList: MemoDatabase.dataList);
  }

  Widget desktopWidget() {
    return Row(
      children: [
        // list drawer
        SizedBox(
          width: 300,
          child: ListViewMemo(dataList: MemoDatabase.dataList),
        ),
        const VerticalDivider(width: 0),
        // detail
        Expanded(
          child: DetailMemo(
            key: ValueKey(context.watch<SelectedMemo>().selectedMemo.id),
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
    );
  }

}