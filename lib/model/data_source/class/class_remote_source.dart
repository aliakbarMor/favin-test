import 'package:favin_test/base/api/api.dart';
import 'package:favin_test/model/data_source/class/class_source.dart';
import 'package:favin_test/model/entities/class/class.dart';

class ClassRemoteSource extends ClassSource {
  ClassRemoteSource(this.api);

  final AppApi api;

  @override
  Future addClass(Class item) {
    return api.post('/api/jobtest/${item.classNumber}', item.toJson());
  }

  @override
  Future getAllClass() {
    return api.get('/api/jobtest/');
  }
}
