import 'package:flutter/material.dart';

import '../data/memo_data.dart';
import '../data/memo_database.dart';
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
  static const int kMobileMaxWidth = 600;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool mobileUi = MediaQuery.of(context).size.width < kMobileMaxWidth;
    if (mobileUi) {
      return ListViewMemo(
        dataList: widget.dataList,
        selectedIndex: selectedIndex,
        selectedCallback: (index) {
          setState(() {
            selectedIndex = index;
          });

          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailMemo(
                    memoData: widget.dataList[selectedIndex],
                    showAppbar: true,
                  );
                },
              )
          );
        },
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
              selectedIndex: selectedIndex,
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
            child: DetailMemo(
              memoData: widget.dataList[selectedIndex],
              showAppbar: false,
            ),
          ),
        ],
      );
    }
  }

}