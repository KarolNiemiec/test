import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class TestVievController extends GetxController {
  var image =
      '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';
  List<Widget> getTitleWidget() {
    return [
      _getTitleItemWidget('a', 50),
      _getTitleItemWidget('b', 125),
      _getTitleItemWidget('c', 100),
      _getTitleItemWidget('Image', 125),
      _getTitleItemWidget('d', 100),
      _getTitleItemWidget('e', 100),
      _getTitleItemWidget('f see', 100),
      _getTitleItemWidget('g', 100),
    ];
  }

  Widget _getTitleItemWidget(
    String label,
    double width,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        width: width,
        height: 56,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget generateFirstColumnRow(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        child: Text(
          '${1}.',
        ),
        width: 50,
        height: 52,
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget generateRightHandSideColumnRow(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              '${1}',
            ),
            width: 125,
            height: 52,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: Text('${2}'),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: Image.memory(base64Decode(image)),
            width: 125,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: Row(
              children: [
                Text('${3}'),
              ],
            ),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: Text('4'),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: Text('5'),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
          ),
          Container(
            child: Text('5'),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}
