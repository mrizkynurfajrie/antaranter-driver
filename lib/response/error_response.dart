// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

List<ErrorResponse> errorResponseFromJson(String str) => List<ErrorResponse>.from(json.decode(str).map((x) => ErrorResponse.fromJson(x)));

String errorResponseToJson(List<ErrorResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ErrorResponse {
    ErrorResponse({
        this.message,
    });

    Message? message;

    factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        message: Message.fromJson(json["message"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
    };
}

class Message {
    Message({
        this.code,
        this.message,
    });

    String? code;
    String? message;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
    };
}
