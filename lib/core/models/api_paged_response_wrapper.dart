import 'dart:convert';

class ApiPagedResponseWrapper<T> {
  final int total;
  final int start;
  final int limit;
  final List<dynamic> data;

  ApiPagedResponseWrapper({
    required this.total,
    required this.start,
    required this.limit,
    this.data = const [],
  });

  factory ApiPagedResponseWrapper.fromJson(Map<String, dynamic> json) =>
      ApiPagedResponseWrapper(
        total: json["total"],
        start: json["start"],
        limit: json["limit"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "start": start,
        "limit": limit,
        "data": jsonEncode(data),
      };
}

// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class ApiResponseModel<T> extends Equatable {
//   final int status;
//   final String message;
//   final int dataCount;
//   final int totalCount;
//   final T data;
//   ApiResponseModel(
//       {this.status, this.message, this.data, this.dataCount, this.totalCount});
//   factory ApiResponseModel.fromJson(Map<String, dynamic> json, T data) {
//     return ApiResponseModel(
//         status: json['status'],
//         message: json['message'],
//         dataCount: json['dataCount'],
//         totalCount: json['totalCount'],
//         data: data);
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'data': data,
//       'dataCount': dataCount,
//       'totalCount': totalCount
//     };
//   }

//   @override
//   // TODO: implement props
//   List<Object> get props => [status, message, data, totalCount, totalCount];
// }

// class ApiPagedResponseWrapper<T> implements _$ApiPagedResponseWrapper<T> {
//   // const ApiPagedResponseWrapper._();
//   const factory ApiPagedResponseWrapper({
//     required int status,
//     @Default("") String message,
//     @Default([]) List<dynamic> data,
//   }) = _ApiPagedResponseWrapper<T>;

//   factory ApiPagedResponseWrapper.fromJson(Map<String, dynamic> json) =>
//       _$ApiPagedResponseWrapperFromJson<T>(json);

//   // bool isSuccess() => this.status == 1;
//   // bool isFailed() => this.status == 0;
//   // bool isError() => this.status == -1;
//   // bool isSpecial() => this.status > 1;
// }
