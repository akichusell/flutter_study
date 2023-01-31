import 'package:flutter/material.dart';
import 'package:flutter_study/provider/selected_memo.dart';
import 'package:provider/provider.dart';

import '../data/memo_data.dart';
import '../provider/mobile_layout.dart';
import 'detail_memo.dart';

class ListItem extends StatelessWidget {
  final MemoData memoData;

  const ListItem({
    required this.memoData,
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
          border: context.watch<SelectedMemo>().selectedMemo == memoData ?
            Border.all(
              color: Colors.blue,
              width: 2,
            ) :
            Border.all(
              color: Colors.transparent,
              width: 2,
            ),
        ),
        child: InkWell (
          onTap: () {
            // change selected item
            context.read<SelectedMemo>().changeSelectedMemo(memoData);

            if (context.read<MobileLayout>().mobileLayout) {
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailMemo(
                      key: ValueKey(context.watch<SelectedMemo>().selectedMemo?.id ?? -1),
                      // key: ValueKey(context.select((SelectedMemo memo) => memo.selectedMemo?.id ?? -1)),
                    );
                  },
                )
              );
            }
          },
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            alignment: Alignment.center,
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  Text(
                    memoData.title.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Expanded(
                    child: Text(
                      memoData.content.toString(),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
