import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/memo_database.dart';
import '../provider/selected_memo.dart';
import 'list_item.dart';

class ListViewMemo extends StatelessWidget {
  const ListViewMemo({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return
    Column(
      children: [
        ElevatedButton(
          onPressed: () {
            var memoData = context.read<MemoDatabase>().createNewMemo();
            context.read<SelectedMemo>().changeSelectedMemo(memoData);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: const Text("ADD NOTE"),
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     context.read<MemoDatabase>().clearMemos();
        //   },
        //   style: ElevatedButton.styleFrom(
        //     minimumSize: const Size.fromHeight(50),
        //   ),
        //   child: const Text("DEBUG : CLEAR ALL NOTE"),
        // ),
        Expanded(
          child: ListView.builder(
            itemCount: context.watch<MemoDatabase>().length(),
            itemBuilder: (context, index) {
              return ListItem(
                memo: context.watch<MemoDatabase>().getMemo(index),
              );
            },
          ),
        ),
      ],
    )
    ;
  }
}