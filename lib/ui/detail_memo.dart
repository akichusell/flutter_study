import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/memo_data.dart';
import '../data/selected_memo.dart';

class DetailMemo extends StatefulWidget {
  final bool showAppbar;
  // final ValueChanged<MemoData> textChanged;

  const DetailMemo({
    required this.showAppbar,
    // required this.textChanged,
    super.key,
  });

  @override
  DetailMemoState createState() => DetailMemoState();
}

class DetailMemoState extends State<DetailMemo> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("seil.chu - DetailMemoState :: initState ${context.read<SelectedMemo>().selectedMemo.title}");

    _titleTextController.text = context.read<SelectedMemo>().selectedMemo.title;
    _titleTextController.addListener(() {
      context.read<SelectedMemo>().updateMemoTitle(_titleTextController.text);
    });

    _contentTextController.text = context.read<SelectedMemo>().selectedMemo.content;
    _contentTextController.addListener(() {
      context.read<SelectedMemo>().updateMemoContent(_contentTextController.text);
    });
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _contentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showAppbar) {
      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body:_detailWidget(context, const EdgeInsets.fromLTRB(25, 5, 25, 0)),
      );
    }
    else {
      return _detailWidget(context, const EdgeInsets.fromLTRB(25, 25, 25, 0));
    }
  }

  Widget _detailWidget(BuildContext context, EdgeInsetsGeometry padding ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: padding,
            child: TextField(
              controller: _titleTextController,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                counter: SizedBox(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child:TextField(
                controller: _contentTextController,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counter: SizedBox(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}