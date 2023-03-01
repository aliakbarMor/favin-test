import 'package:favin_test/model/entities/class/class.dart';

abstract class ClassSource {
  Future<dynamic> getAllClass();
  Future<dynamic> addClass(Class item);
}
