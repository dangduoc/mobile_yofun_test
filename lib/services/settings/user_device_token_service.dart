import 'dart:convert';

import 'package:flutter_application_test/core/config/api.dart';
import 'package:flutter_application_test/core/models/api_paged_response_wrapper.dart';
import 'package:flutter_application_test/core/models/api_response_wrapper.dart';
import 'package:http/http.dart' as http;

class UserDeviceToken {
  UserDeviceToken({
    required this.id,
    required this.createdAt,
    required this.deviceToken,
    required this.registerId,
    required this.platform,
    required this.deviceId,
    required this.userId,
  });

  final int id;
  final DateTime createdAt;
  final String deviceToken;
  final String registerId;
  final String platform;
  final String deviceId;
  final int userId;

  factory UserDeviceToken.fromJson(Map<String, dynamic> json) =>
      UserDeviceToken(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        deviceToken: json["deviceToken"],
        registerId: json["registerId"],
        platform: json["platform"],
        deviceId: json["deviceId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toString(),
        "deviceToken": deviceToken,
        "registerId": registerId,
        "platform": platform,
        "deviceId": deviceId,
        "userId": userId,
      };
}

class NotificationModel {
  NotificationModel({
    this.id,
    this.createOnDate,
    this.notifierId,
    this.notifier,
    this.actor,
    this.avatarPhoTo,
    this.entityId,
    this.entityTypeId,
    this.entityActionId,
    this.entityName,
    this.messageTemplate,
    this.message,
    this.data,
    this.notifierRegisterToken,
  });

  final int? id;
  final DateTime? createOnDate;
  final int? notifierId;
  final String? notifier;
  final String? actor;
  final String? avatarPhoTo;
  final int? entityId;
  final String? entityTypeId;
  final String? entityActionId;
  final String? entityName;
  final String? messageTemplate;
  final String? message;
  final String? data;
  final String? notifierRegisterToken;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"] == null ? null : json["id"],
        createOnDate: json["createOnDate"] == null
            ? null
            : DateTime.parse(json["createOnDate"]),
        notifierId: json["notifierId"] == null ? null : json["notifierId"],
        notifier: json["notifier"] == null ? null : json["notifier"],
        actor: json["actor"] == null ? null : json["actor"],
        avatarPhoTo: json["avatarPhoTo"] == null ? null : json["avatarPhoTo"],
        entityId: json["entityId"] == null ? null : json["entityId"],
        entityTypeId:
            json["entityTypeId"] == null ? null : json["entityTypeId"],
        entityActionId:
            json["entityActionId"] == null ? null : json["entityActionId"],
        entityName: json["entityName"] == null ? null : json["entityName"],
        messageTemplate:
            json["messageTemplate"] == null ? null : json["messageTemplate"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
        notifierRegisterToken: json["notifierRegisterToken"] == null
            ? null
            : json["notifierRegisterToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "createOnDate":
            createOnDate == null ? null : createOnDate!.toIso8601String(),
        "notifierId": notifierId == null ? null : notifierId,
        "notifier": notifier == null ? null : notifier,
        "actor": actor == null ? null : actor,
        "avatarPhoTo": avatarPhoTo == null ? null : avatarPhoTo,
        "entityId": entityId == null ? null : entityId,
        "entityTypeId": entityTypeId == null ? null : entityTypeId,
        "entityActionId": entityActionId == null ? null : entityActionId,
        "entityName": entityName == null ? null : entityName,
        "messageTemplate": messageTemplate == null ? null : messageTemplate,
        "message": message == null ? null : message,
        "data": data == null ? null : data,
        "notifierRegisterToken":
            notifierRegisterToken == null ? null : notifierRegisterToken,
      };
}

abstract class IUserDeviceTokenService {
  Future<ApiResponseWrapper<dynamic>> registerTokenForUser({
    required int userId,
    required String deviceToken,
    required String deviceId,
    String platform = "gcm",
    String? registerId,
    bool useLocalApi = false,
  });

  Future<ApiResponseWrapper<dynamic>> removeToken({
    required int userId,
    required String deviceToken,
    bool useLocalApi = false,
  });

  Future<ApiPagedResponseWrapper<List<NotificationModel>>> getNotifications({
    required int userId,
    int start = 0,
    int limit = 10,
    bool useLocalApi = false,
  });
}

class UserDeviceTokenService implements IUserDeviceTokenService {
  final http.Client _client;
  UserDeviceTokenService(this._client);
  @override
  Future<ApiResponseWrapper<dynamic>> registerTokenForUser({
    required int userId,
    required String deviceToken,
    required String deviceId,
    String platform = "gcm",
    String? registerId,
    bool useLocalApi = false,
  }) async {
    String _url = useLocalApi
        ? Api.LOCAL_BASE_URL
        : Api.REMOTE_BASE_URL + Api.DEVICE_TOKEN;
    final http.Response response = await _client.post(
      Uri.parse(_url),
      headers: {'content-type': 'application/json'},
      body: jsonEncode({
        "userId": userId,
        "deviceToken": deviceToken,
        "deviceId": deviceId,
        "platform": platform,
        "registerId": ""
      }),
    );
    if (response.statusCode != 200) throw Exception();
    var responseJson = json.decode(response.body.toString());
    return ApiResponseWrapper.fromJson(responseJson);
  }

  @override
  Future<ApiResponseWrapper<dynamic>> removeToken({
    required int userId,
    required String deviceToken,
    bool useLocalApi = false,
  }) async {
    String _url = useLocalApi
        ? Api.LOCAL_BASE_URL
        : Api.REMOTE_BASE_URL + Api.DEVICE_TOKEN;
    final http.Response response = await _client.delete(
      Uri.parse(_url),
      headers: {'content-type': 'application/json'},
      body: jsonEncode({
        "userId": userId,
        "deviceToken": deviceToken,
      }),
    );
    if (response.statusCode != 200) throw Exception();
    var responseJson = json.decode(response.body.toString());
    return ApiResponseWrapper.fromJson(responseJson);
  }

  @override
  Future<ApiPagedResponseWrapper<List<NotificationModel>>> getNotifications({
    required int userId,
    int start = 0,
    int limit = 10,
    bool useLocalApi = false,
  }) async {
    String _url = useLocalApi
        ? Api.LOCAL_BASE_URL
        : Api.REMOTE_BASE_URL +
            Api.NOTIFICATION +
            '/$userId/GetByUserId?start=$start&limit=$limit';
    final http.Response response = await _client.get(
      Uri.parse(_url),
      headers: {'content-type': 'application/json'},
    ).timeout(Duration(seconds: 10));

    if (response.statusCode != 200) throw Exception();
    var responseJson = json.decode(response.body.toString());
    return ApiPagedResponseWrapper.fromJson(responseJson);
  }
}
