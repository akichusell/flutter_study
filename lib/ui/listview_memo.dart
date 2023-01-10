
import 'package:flutter/material.dart';

import '../data/memo_data.dart';
import 'list_item.dart';

// ignore: must_be_immutable
class ListViewMemo extends StatefulWidget {
  List<MemoData> dataList = <MemoData>[
    MemoData(
        title:"title 1",
        content:"content 1"
    ),
    MemoData(
        title: "title 2",
        content: "content 2"
    ),
    MemoData(
        title: "title 3",
        content: "content 3"
    ),
    MemoData(
        title: "title 4",
        content: "content 4"
    ),
  ];

  ListViewMemo({super.key});

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
              setState(() {
                  selectedIndex = index;
              });
            },
          );
        },
    );
  }
}