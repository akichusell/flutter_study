import 'package:flutter/material.dart';

import '../data/memo_data.dart';

class DetailMemo extends StatelessWidget {
  final MemoData memoData;

  const DetailMemo({required this.memoData, super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 5,),
            Text(
              memoData.title.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: 5,),
            Expanded(
              child: Text(
                memoData.content.toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      );
  }

}