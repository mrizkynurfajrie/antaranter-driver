// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        this.id,
        this.username,
        this.email,
        this.password,
        this.nik,
        this.ktpPict,
        this.image,
        this.birth,
        this.address,
        this.phone,
        this.status,
        this.lat,
        this.lang,
        this.city,
        this.role,
        this.fcm,
        this.blockedAt,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
    });

    int? id;
    dynamic username;
    dynamic email;
    String? password;
    dynamic nik;
    dynamic ktpPict;
    dynamic image;
    dynamic birth;
    dynamic address;
    String? phone;
    int? status;
    dynamic lat;
    dynamic lang;
    dynamic city;
    String? role;
    String? fcm;
    dynamic blockedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic isDeleted;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        nik: json["nik"],
        ktpPict: json["ktp_pict"],
        image: json["image"],
        birth: json["birth"],
        address: json["address"],
        phone: json["phone"],
        status: json["status"],
        lat: json["lat"],
        lang: json["lang"],
        city: json["city"],
        role: json["role"],
        fcm: json["fcm"],
        blockedAt: json["blockedAt"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "nik": nik,
        "ktp_pict": ktpPict,
        "image": image,
        "birth": birth,
        "address": address,
        "phone": phone,
        "status": status,
        "lat": lat,
        "lang": lang,
        "city": city,
        "role": role,
        "fcm": fcm,
        "blockedAt": blockedAt,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
    };

    factory Users.fromArguments(Map<String, dynamic> json) => Users(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        nik: json["nik"],
        ktpPict: json["ktp_pict"],
        image: json["image"],
        birth: json["birth"],
        address: json["address"],
        phone: json["phone"],
        status: json["status"],
        lat: json["lat"],
        lang: json["lang"],
        city: json["city"],
        role: json["role"],
        fcm: json["fcm"],
        blockedAt: json["blockedAt"],
        createdAt: json["createdAt"].toIso8601String(),
        updatedAt: json["updatedAt"].toIso8601String(),
        isDeleted: json["isDeleted"],
      );
}
