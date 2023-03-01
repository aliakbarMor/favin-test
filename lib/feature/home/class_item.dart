import 'package:favin_test/feature/home/add_class.dart';
import 'package:favin_test/feature/home/show_detail.dart';
import 'package:favin_test/model/entities/class/class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClassItem extends StatelessWidget {
  const ClassItem({super.key, required this.item, required this.index});
  final Class item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: index % 2 != 0
          ? Colors.transparent
          : Get.theme.primaryColor.withOpacity(.1),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Center(
                  child:
                      Text(index.toString(), style: Get.textTheme.bodyText1))),
          Expanded(
              flex: 2,
              child: Center(
                  child:
                      Text(item.classNumber!, style: Get.textTheme.bodyText1))),
          Expanded(
              flex: 2,
              child: Center(
                  child:
                      Text(item.className!, style: Get.textTheme.bodyText1))),
          Expanded(
              flex: 2,
              child: Center(
                  child: FittedBox(
                child: Text(
                    DateFormat('yyyy/MM/dd')
                        .format(DateTime.parse(item.registrationTime!)),
                    style: Get.textTheme.bodyText2),
              ))),
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                      DateFormat('kk:mm')
                          .format(DateTime.parse(item.registrationTime!)),
                      style: Get.textTheme.bodyText1))),
          InkWell(
            onTap: () => showDialogDetailClass(item),
            child: const Expanded(
                flex: 1,
                child: Center(child: Icon(Icons.remove_red_eye_outlined))),
          ),
        ],
      ),
    );
  }
}
