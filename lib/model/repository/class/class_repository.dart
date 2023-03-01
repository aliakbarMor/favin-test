import 'package:favin_test/model/entities/base/api_response.dart';
import 'package:favin_test/model/entities/class/class.dart';

abstract class ClassRepository {
  Future<ApiResponse<List<Class>>> getAllClass();
  Future<ApiResponse<bool>> addClass(Class item);
}
