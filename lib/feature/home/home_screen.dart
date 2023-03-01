import 'package:favin_test/feature/home/add_class.dart';
import 'package:favin_test/feature/home/class_item.dart';
import 'package:favin_test/feature/home/home_controller.dart';
import 'package:favin_test/locator.dart';
import 'package:favin_test/model/entities/base/status.dart';
import 'package:favin_test/model/entities/class/class.dart';
import 'package:favin_test/model/repository/class/class_repository.dart';
import 'package:favin_test/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(HomeController(classRepository: locator<ClassRepository>()));

    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('لیست کلاس ها', style: Get.textTheme.bodyText1),
          Text('ترم اول - سال 1401', style: Get.textTheme.bodyText1),
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => showDialogAddClass(
                      controller.className,
                      controller.classNumber,
                      controller.classDescription,
                      () => controller.addClass()),
                  child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        children: [
                          const Icon(Icons.add_circle_rounded,
                              color: Colors.black),
                          const SizedBox(width: 4),
                          Text('اضافه کردن کلاس',
                              style: Get.textTheme.bodyText1),
                        ],
                      )),
                ),
                InkWell(
                  onTap: () => controller.getAllClasses(),
                  child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Get.theme.backgroundColor,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 1,
                                color: context.theme.dividerColor),
                          ]),
                      child: const Icon(Icons.refresh, color: Colors.grey)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]!),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(6)),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 1,
                      color: context.theme.dividerColor),
                ],
              ),
              child: GetX<HomeController>(builder: (controller) {
                return controller.resGetAllClass.value.status ==
                        Status.completed
                    ? Container(
                        color: Get.theme.backgroundColor,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              controller.resGetAllClass.value.data!.length + 1,
                          itemBuilder: (context, index) {
                            return index != 0
                                ? ClassItem(
                                    item: controller
                                        .resGetAllClass.value.data![index - 1],
                                    index: index)
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 6),
                                    decoration: BoxDecoration(
                                        color: Get.theme.primaryColor,
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: Radius.circular(6))),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: Text('ردیف',
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                          color: Get.theme
                                                              .onPrimaryColor)),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                                child: Text('شماره کلاس',
                                                    textAlign: TextAlign.center,
                                                    style: Get
                                                        .textTheme.bodyText1!
                                                        .copyWith(
                                                            color: Get.theme
                                                                .onPrimaryColor)))),
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text('نام کلاس',
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                          color: Get.theme
                                                              .onPrimaryColor)),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text('زمان ثبت',
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                          color: Get.theme
                                                              .onPrimaryColor)),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Text('ساعت',
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                          color: Get.theme
                                                              .onPrimaryColor)),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: Text('مشاهده',
                                                  style: Get
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                          color: Get.theme
                                                              .onPrimaryColor)),
                                            )),
                                      ],
                                    ),
                                  );
                          },
                        ),
                      )
                    : const Center(child: CircularProgressIndicator());
              }),
            )
          ]),
        ),
      ),
    );
  }
}
