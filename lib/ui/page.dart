import 'package:flutter/material.dart';

import '../data/memo_data.dart';
import 'detail_memo.dart';
import 'listview_memo.dart';

// ignore: must_be_immutable
class AppPage extends StatefulWidget {
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

  AppPage({super.key});

  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // list drawer
        SizedBox(
          width: 300,
          child: ListViewMemo(
            dataList:widget.dataList,
            selectedCallback: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
        const VerticalDivider(width: 0,),
        // detail
        Expanded(
          child: DetailMemo(memoData:widget.dataList[selectedIndex]),
        ),
      ],
    );
  }

}