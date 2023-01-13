import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/memo_data.dart';
import '../data/memo_database.dart';
import '../data/selected_memo.dart';
import 'detail_memo.dart';
import 'listview_memo.dart';

// ignore: must_be_immutable
class AppPage extends StatefulWidget {
  final List<MemoData> dataList = MemoDatabase.dataList;

  AppPage({super.key});

  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  static const int kMobileMaxWidth = 400;

  @override
  Widget build(BuildContext context) {
    final bool mobileUi = MediaQuery.of(context).size.width < kMobileMaxWidth;
    if (mobileUi) {
      return ListViewMemo(
        dataList: widget.dataList,
        isMobileUI: mobileUi
      );
    }
    else {
      return Row(
        children: [
          // list drawer
          SizedBox(
            width: 300,
            child: ListViewMemo(
              dataList: widget.dataList,
              isMobileUI: mobileUi
            ),
          ),
          const VerticalDivider(width: 0),
          // detail
          Expanded(
            child: DetailMemo(
              showAppbar: mobileUi,
              key: ValueKey(context.watch<SelectedMemo>().selectedMemo.id),
            ),
          ),
        ],
      );
    }
  }

}