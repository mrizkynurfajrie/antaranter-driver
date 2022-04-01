import 'dart:convert';

import 'package:intake_rider/response/users.dart';

NebengOrder nebengOrderFromJson(String str) => NebengOrder.fromJson(json.decode(str));

String nebengOrderToJson(NebengOrder data) => json.encode(data.toJson());

class NebengOrder {
    NebengOrder({
        this.id,
        this.usersId,
        this.nebengPostingId,
        this.rating,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.users,
    });

    int? id;
    int? usersId;
    int? nebengPostingId;
    int? rating;
    int? status;
    DateTime? updatedAt;
    DateTime? createdAt;
    Users? users;

    factory NebengOrder.fromJson(Map<String, dynamic> json) => NebengOrder(
        id: json["id"],
        usersId: json["users_id"],
        nebengPostingId: json["nebeng_posting_id"],
        rating: json["rating"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        users: json["users"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "nebeng_posting_id": nebengPostingId,
        "rating": rating,
        "status": status,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "users": users?.toJson(),
    };

    factory NebengOrder.fromArguments(Map<String, dynamic> json) =>
      NebengOrder(
        id: json["id"],
        usersId: json["users_id"],
        nebengPostingId: json["nebeng_posting_id"],
        rating: json["rating"],
        status: json["status"],
        updatedAt: json["updatedAt"],
        createdAt: json["createdAt"],
        users: Users.fromArguments(json["users"]),
      );
}