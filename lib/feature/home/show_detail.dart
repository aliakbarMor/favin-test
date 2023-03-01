import 'package:favin_test/model/entities/class/class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:favin_test/theme/colors.dart';
import 'package:intl/intl.dart';

showDialogDetailClass(Class item) {
  showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          backgroundColor: Colors.grey[100]!,
          content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_left_rounded,
                            color: Get.theme.primaryColor),
                        const SizedBox(width: 4),
                        Text('جزئیات کلاس',
                            style: Get.textTheme.bodyText1!
                                .copyWith(color: Get.theme.primaryColor)),
                      ],
                    ),
                    const SizedBox(width: 6),
                    Row(
                      children: [
                        Text(
                            DateFormat('yyyy/MM/dd')
                                .format(DateTime.parse(item.registrationTime!)),
                            style: Get.textTheme.bodyText1),
                        const SizedBox(width: 4),
                        Text(
                            DateFormat('kk:mm')
                                .format(DateTime.parse(item.registrationTime!)),
                            style: Get.textTheme.bodyText1)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Text('شماره کلاس', style: Get.textTheme.bodyText1),
                        const SizedBox(width: 4),
                        Expanded(
                            child: Container(
                          color: Colors.white,
                          child: Text(item.classNumber.toString(),
                              textAlign: TextAlign.center,
                              style: Get.textTheme.bodyText1),
                        ))
                      ],
                    )),
                    const SizedBox(width: 6),
                    Expanded(
                        child: Row(
                      children: [
                        Text('نام کلاس', style: Get.textTheme.bodyText1),
                        const SizedBox(width: 4),
                        Expanded(
                            child: Container(
                          color: Colors.white,
                          child: Text(item.className.toString(),
                              textAlign: TextAlign.center,
                              style: Get.textTheme.bodyText1),
                        ))
                      ],
                    ))
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.white,
                  child: Text(item.description.toString(),
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyText1),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Get.theme.primaryColor,
                    ),
                    child: Text('بستن',
                        style: Get.textTheme.bodyText1!
                            .copyWith(color: Get.theme.onPrimaryColor)),
                  ),
                ),
              ]),
        );
      });
}
