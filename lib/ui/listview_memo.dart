import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/memo_data.dart';
import '../data/selected_memo.dart';
import 'list_item.dart';

class ListViewMemo extends StatelessWidget {
  final List<MemoData> dataList;
  final bool isMobileUI;

  const ListViewMemo({
    required this.dataList,
    required this.isMobileUI,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ListItem(
          memoData:dataList[index],
          isMobileUI: isMobileUI,
        );
      },
    );
  }
}