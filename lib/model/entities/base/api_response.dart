import 'package:favin_test/model/entities/base/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse.notStarted() : status = Status.notStarted;

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(Object? error)
      : status = Status.error,
        message = error.toString();

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
