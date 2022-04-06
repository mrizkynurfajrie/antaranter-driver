import 'dart:convert';

loginResponse welcomeFromJson(String str) =>
    loginResponse.fromJson(json.decode(str));

String welcomeToJson(loginResponse data) => json.encode(data.toJson());

class loginResponse {
  loginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.ktp,
    required this.image,
    required this.birth,
    required this.address,
    required this.phone,
    required this.status,
    required this.lat,
    required this.lng,
    required this.city,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.fcm,
  });

  int id;
  dynamic username;
  dynamic email;
  String password;
  dynamic ktp;
  dynamic image;
  dynamic birth;
  dynamic address;
  String phone;
  dynamic status;
  dynamic lat;
  dynamic lng;
  dynamic city;
  String role;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic isDeleted;
  dynamic fcm;

  factory loginResponse.fromJson(Map<String, dynamic> json) => loginResponse(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        ktp: json["ktp"],
        image: json["image"],
        birth: json["birth"],
        address: json["address"],
        phone: json["phone"],
        status: json["status"],
        lat: json["lat"],
        lng: json["lng"],
        city: json["city"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        fcm: json["fcm"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "ktp": ktp,
        "image": image,
        "birth": birth,
        "address": address,
        "phone": phone,
        "status": status,
        "lat": lat,
        "lng": lng,
        "city": city,
        "role": role,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDeleted": isDeleted,
        "fcm": fcm,
      };
}
