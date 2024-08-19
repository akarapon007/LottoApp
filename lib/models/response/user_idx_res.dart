// To parse this JSON data, do
//
//     final userIdxRes = userIdxResFromJson(jsonString);

import 'dart:convert';

UserIdxRes userIdxResFromJson(String str) => UserIdxRes.fromJson(json.decode(str));

String userIdxResToJson(UserIdxRes data) => json.encode(data.toJson());

class UserIdxRes {
    int uid;
    String username;
    String email;
    String phone;
    String img;

    UserIdxRes({
        required this.uid,
        required this.username,
        required this.email,
        required this.phone,
        required this.img,
    });

    factory UserIdxRes.fromJson(Map<String, dynamic> json) => UserIdxRes(
        uid: json["uid"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "phone": phone,
        "img": img,
    };
}
