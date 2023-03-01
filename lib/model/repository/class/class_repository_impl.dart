import 'package:favin_test/base/app_exception.dart';
import 'package:favin_test/model/data_source/class/class_source.dart';
import 'package:favin_test/model/entities/base/api_response.dart';
import 'package:favin_test/model/entities/class/class.dart';
import 'package:favin_test/model/repository/class/class_repository.dart';

class ClassRepositoryImpl extends ClassRepository {
  ClassRepositoryImpl({required this.remoteSource, required this.localSource});

  final ClassSource remoteSource;
  final ClassSource localSource;

  @override
  Future<ApiResponse<bool>> addClass(Class item) async {
    await localSource.addClass(item);
    //TODO
    // remoteSource.addClass(item);
    // try {
    //   var response = await remoteSource.addClass(item);
    //   return ApiResponse.completed(
    //     jsonDecode(response),
    //   );
    // } on AppException catch (exception) {
    //   return ApiResponse.error(exception.prefix);
    // }
    return ApiResponse.completed(true);
  }

  @override
  Future<ApiResponse<List<Class>>> getAllClass() async {
    var classes = await localSource.getAllClass();
    return ApiResponse.completed(classes as List<Class>?);
  }
}
