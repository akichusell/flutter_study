import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/memo_data.dart';
import '../data/memo_database.dart';
import '../provider/mobile_layout.dart';
import '../provider/selected_memo.dart';
import 'detail_memo.dart';
import 'listview_memo.dart';

// ignore: must_be_immutable
class AppPage extends StatelessWidget {
  final List<MemoData> dataList = MemoDatabase.dataList;
  static const int kMobileMaxWidth = 400;

  AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool mobileUi = MediaQuery.of(context).size.width < kMobileMaxWidth;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // 첫빌드 이후에 실행
      context.read<MobileLayout>().updateMobileLayout(mobileUi);
    });

    if (mobileUi) {
      return ListViewMemo(dataList: dataList);
    }
    else {
      return Row(
        children: [
          // list drawer
          SizedBox(
            width: 300,
            child: ListViewMemo(dataList: dataList),
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
  }

}