// To parse this JSON data, do
//
//     final userLoginPostRes = userLoginPostResFromJson(jsonString);

import 'dart:convert';

UserLoginPostRes userLoginPostResFromJson(String str) => UserLoginPostRes.fromJson(json.decode(str));

String userLoginPostResToJson(UserLoginPostRes data) => json.encode(data.toJson());

class UserLoginPostRes {
  String message;
  User user;

  UserLoginPostRes({
    required this.message,
    required this.user,
  });

  factory UserLoginPostRes.fromJson(Map<String, dynamic> json) =>
      UserLoginPostRes(
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
      };
}

class User {
    int uid;
    String username;
    String email;
    String phone;
    String password;
    String img;

    User({
        required this.uid,
        required this.username,
        required this.email,
        required this.phone,
        required this.password,
        required this.img,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "img": img,
    };
}
