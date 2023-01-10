
import 'package:flutter/material.dart';

import '../data/memo_data.dart';

class ListItem extends StatelessWidget {
  final MemoData memoData;

  const ListItem({required this.memoData, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        height: 130,
        child: Column(
          children: [
            // title
            Text(
              memoData.title.toString(),
              style: Theme.of(context).textTheme.titleLarge
            ),
            // content
            Expanded(child: Text(
              memoData.content.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ))
          ],
        ),
      ),
    );
  }

}
