import 'package:flutter/material.dart';

import '../data/memo_data.dart';
import 'list_item.dart';

class ListViewMemo extends StatelessWidget {
  final List<MemoData> dataList;
  final int selectedIndex;
  final ValueChanged<int> selectedCallback;

  const ListViewMemo({
    required this.dataList,
    required this.selectedIndex,
    required this.selectedCallback,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ListItem(
          memoData:dataList[index],
          selected: selectedIndex == index,
          onTap: () {
            // TODO: provider 변경
            selectedCallback(index);
          },
        );
      },
    );
  }
}