import 'package:flutter/material.dart';

import '../data/memo_data.dart';
import 'list_item.dart';

class ListViewMemo extends StatelessWidget {
  final List<MemoData> dataList;

  const ListViewMemo({
    required this.dataList,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ListItem(
          memoData:dataList[index],
        );
      },
    );
  }
}