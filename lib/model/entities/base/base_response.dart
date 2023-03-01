class BaseResponse<S> {
  S? data;
  bool? success;
  String? description;
  int? total;

  BaseResponse({
    required this.data,
    required this.success,
    required this.description,
    required this.total,
  });

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, S Function(Object? json) fromJsonS) =>
      BaseResponse<S>(
        data: json['data'] == null ? null : fromJsonS(json['data']),
        success: json['success'] as bool?,
        description: json['description'] as String?,
        total: json['total'] as int?,
      );
}
