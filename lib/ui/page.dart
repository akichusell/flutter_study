import 'package:flutter/material.dart';

import 'listview_memo.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // list drawer
        SizedBox(
          width: 300,
          child: ListViewMemo(),
        ),
        const VerticalDivider(width: 0,),
        // detail
        Expanded(
          child: Container(
            color: Colors.red,
            height: 200,
          ),
        ),
      ],
    );
  }

}