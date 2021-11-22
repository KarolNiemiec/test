import 'package:flutter/material.dart';
import 'package:flutter_application_1/testVievController.dart';
import 'package:get/get.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

final controller = Get.put(TestVievController());

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalDataTable(
      leftHandSideColumnWidth: 50,
      rightHandSideColumnWidth: 750,
      isFixedHeader: true,
      headerWidgets: controller.getTitleWidget(),
      leftSideItemBuilder: controller.generateFirstColumnRow,
      rightSideItemBuilder: controller.generateRightHandSideColumnRow,
      itemCount: 5,
      rowSeparatorWidget: const Divider(
        color: Color(0xfff7f7f7),
        height: 1.0,
        thickness: 2.0,
      ),
      leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
      rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      verticalScrollbarStyle: const ScrollbarStyle(
        thumbColor: Color(0xffF29D00),
        isAlwaysShown: true,
        thickness: 4.0,
        radius: Radius.circular(5.0),
      ),
      horizontalScrollbarStyle: const ScrollbarStyle(
        thumbColor: Color(0xffF29D00),
        isAlwaysShown: true,
        thickness: 4.0,
        radius: Radius.circular(5.0),
      ),
      refreshIndicator: const WaterDropHeader(),
      refreshIndicatorHeight: 60,
    );
  }
}
