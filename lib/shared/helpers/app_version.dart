// To parse this JSON data, do
//
//     final appVersion = appVersionFromJson(jsonString);

import 'dart:convert';

AppVersion appVersionFromJson(String str) => AppVersion.fromJson(json.decode(str));

String appVersionToJson(AppVersion data) => json.encode(data.toJson());

class AppVersion {
    AppVersion({
        this.id,
        this.type,
        this.version,
        this.url,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
    });

    int? id;
    String? type;
    String? version;
    String? url;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? isDeleted;

    factory AppVersion.fromJson(Map<String, dynamic> json) => AppVersion(
        id: json["id"],
        type: json["type"],
        version: json["version"],
        url: json["url"],
        createdAt:json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt:json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "version": version,
        "url": url,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
    };
}
