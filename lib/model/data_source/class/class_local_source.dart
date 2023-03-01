import 'dart:convert';

import 'package:favin_test/model/data_source/class/class_source.dart';
import 'package:favin_test/model/entities/class/class.dart';
import 'package:get_storage/get_storage.dart';
import 'package:favin_test/utils/const.dart';

class ClassLocalSource extends ClassSource {
  ClassLocalSource(this.storage);

  final GetStorage storage;

  @override
  Future addClass(Class item) async {
    List<Class>? classes = await getAllClass();
    classes.add(item);
    await storage.write(Const.classList, jsonEncode(classes));
  }

  @override
  Future<List<Class>> getAllClass() async {
    var test = storage.read(Const.classList);

    var test2 = jsonDecode(test) ?? [];
    print(test2);

    // List<Class> test3 = test2.map((item) => Class.fromJson(item)).toList();
    List<Class> test3 = [];
    (test2 as List<dynamic>?)?.forEach((element) {
      test3.add(Class.fromJson(element));
    });

    print(test2.runtimeType);
    print(test3);

    return test3;
  }
}
