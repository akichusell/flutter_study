import 'package:flutter/material.dart';

import '../data/memo_data.dart';

class DetailMemo extends StatelessWidget {
  final MemoData memoData;
  final bool showAppbar;

  const DetailMemo({
    required this.memoData,
    required this.showAppbar,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    if (showAppbar) {
      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          // title: Text(memoData.title.toString()),
        ),
        body:_detailWidget(context),
      );
    }
    else {
      return _detailWidget(context);
    }
  }

  Widget _detailWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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