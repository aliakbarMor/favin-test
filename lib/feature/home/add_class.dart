import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:favin_test/theme/colors.dart';

showDialogAddClass(
    TextEditingController className,
    TextEditingController classNumber,
    TextEditingController classDescription,
    register) {
  showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          backgroundColor: Colors.grey[100]!,
          content: SizedBox(
            width: double.infinity,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Text('شماره کلاس', style: Get.textTheme.bodyText1),
                          const SizedBox(width: 4),
                          Expanded(child: AppTextField(controller: classNumber))
                        ],
                      )),
                      const SizedBox(width: 6),
                      Expanded(
                          child: Row(
                        children: [
                          Text('نام کلاس', style: Get.textTheme.bodyText1),
                          const SizedBox(width: 4),
                          Expanded(child: AppTextField(controller: className))
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    controller: classDescription,
                    minLine: 5,
                    hint: 'توضیحات',
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      var number = int.tryParse(classNumber.text) ?? 0;
                      if (number < 200 && number > 100) {
                        register();
                      } else {
                        Get.snackbar(
                            'خطا', 'شماره کلاس باید بین 100 و 200 باشد');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Get.theme.primaryColor,
                      ),
                      child: Text('ثبت',
                          style: Get.textTheme.bodyText1!
                              .copyWith(color: Get.theme.onPrimaryColor)),
                    ),
                  ),
                ]),
          ),
        );
      });
}

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key, required this.controller, this.minLine = 1, this.hint});
  final TextEditingController controller;
  final int minLine;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: minLine,
      style: Get.textTheme.bodyText1,
      maxLines: minLine,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 6),
        hintText: hint,
        fillColor: Get.theme.backgroundColor,
        filled: true,
        focusColor: Get.theme.backgroundColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 0, color: Get.theme.dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 0, color: Get.theme.dividerColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 0, color: Get.theme.dividerColor),
        ),
      ),
    );
  }
}
