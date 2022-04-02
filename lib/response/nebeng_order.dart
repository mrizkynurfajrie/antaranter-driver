import 'dart:convert';

import 'package:intake_rider/response/users.dart';

NebengOrder nebengOrderFromJson(String str) =>
    NebengOrder.fromJson(json.decode(str));

String nebengOrderToJson(NebengOrder data) => json.encode(data.toJson());

class NebengOrder {
  NebengOrder({
   required this.id,
   required this.usersId,
   required this.nebengPostingId,
   required this.rating,
   required this.status,
   required this.updatedAt,
   required this.createdAt,
   required this.isDeleted,
    this.users,
  });

  int? id;
  int? usersId;
  int? nebengPostingId;
  int? rating;
  int? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  dynamic isDeleted;
  Users? users;

  factory NebengOrder.fromJson(Map<String, dynamic> json) => NebengOrder(
      id: json["id"],
      usersId: json["users_id"],
      nebengPostingId: json["nebeng_posting_id"],
      rating: json["rating"],
      status: json["status"],
      updatedAt:
          json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      createdAt:
          json["updatedAt"] == null ? null : DateTime.parse(json["createdAt"]),
      isDeleted: json["isDeleted"],
      users: Users.fromJson(json["users"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "nebeng_posting_id": nebengPostingId,
        "rating": rating,
        "status": status,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "isDeleted": isDeleted,
        "users": users?.toJson(),
      };

  factory NebengOrder.fromArguments(Map<String, dynamic> json) => NebengOrder(
        id: json["id"],
        usersId: json["users_id"],
        nebengPostingId: json["nebeng_posting_id"],
        rating: json["rating"],
        status: json["status"],
        updatedAt: json["updatedAt"],
        createdAt: json["createdAt"],
        isDeleted: json["isDeleted"],
        // users: Users.fromArguments(json["users"]),
      );
}
