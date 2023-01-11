
import 'package:flutter/material.dart';

import '../data/memo_data.dart';
import 'list_item.dart';

class ListViewMemo extends StatefulWidget {
  final List<MemoData> dataList;
  final ValueChanged<int> selectedCallback;

  const ListViewMemo({
    required this.dataList,
    required this.selectedCallback,
    super.key
  });

  @override
  ListViewMemoState createState() => ListViewMemoState();
}

class ListViewMemoState extends State<ListViewMemo> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          return ListItem(
            memoData:widget.dataList[index],
            selected: selectedIndex == index,
            onTap: () {
              // TODO: Provider 패턴으로 변경
              setState(() {
                  selectedIndex = index;
              });
              widget.selectedCallback(index);
            },
          );
        },
    );
  }
}