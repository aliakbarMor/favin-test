import 'package:favin_test/model/entities/base/api_response.dart';
import 'package:favin_test/model/entities/base/status.dart';
import 'package:favin_test/model/entities/class/class.dart';
import 'package:favin_test/model/repository/class/class_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({required this.classRepository});
  final ClassRepository classRepository;

  TextEditingController classNumber = TextEditingController();
  TextEditingController className = TextEditingController();
  TextEditingController classDescription = TextEditingController();

  Rx<ApiResponse<List<Class>>> resGetAllClass =
      ApiResponse<List<Class>>.notStarted().obs;
  var resAddClass = ApiResponse.notStarted().obs;

  @override
  void onInit() {
    getAllClasses();
    super.onInit();
  }

  getAllClasses() async {
    resGetAllClass.value = ApiResponse.loading();
    resGetAllClass.value = await classRepository.getAllClass();
    if (resGetAllClass.value.status == Status.completed) {
    } else {
      print(resGetAllClass);
      // handle error
    }
  }

  addClass() async {
    resAddClass.value = ApiResponse.loading();
    resAddClass.value = await classRepository.addClass(Class(
        classNumber.text,
        className.text,
        classDescription.text,
        DateTime.now().toUtc().toString()));
    if (resAddClass.value.status == Status.completed) {
      Get.back();
      getAllClasses();
    } else {
      print(resAddClass);
      // handle error
    }
  }
}
