import 'package:flutter/material.dart';

import '../data/memo_data.dart';

class ListItem extends StatelessWidget {
  final MemoData memoData;
  final bool selected;
  final GestureTapCallback? onTap;

  const ListItem({
    required this.memoData,
    required this.selected,
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1),
            )
          ],
          border: selected ?
            Border.all(
              color: Colors.red,
              width: 5,
            ) :
            Border.all(
              color: Colors.transparent,
              width: 5,
            ),
        ),
        child: InkWell (
          onTap: () {
            onTap!();
          },
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            alignment: Alignment.center,
            height: 130,
            child: Column(
              children: [
                const SizedBox(height: 5,),
                Text(
                  memoData.title.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ), // title
                const SizedBox(height: 5,),
                Expanded( // content
                  child: Text(
                    memoData.content.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
