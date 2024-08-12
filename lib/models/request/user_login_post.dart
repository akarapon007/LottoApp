// To parse this JSON data, do
//
//     final userLoginPost = userLoginPostFromJson(jsonString);

import 'dart:convert';

UserLoginPost userLoginPostFromJson(String str) => UserLoginPost.fromJson(json.decode(str));

String userLoginPostToJson(UserLoginPost data) => json.encode(data.toJson());

class UserLoginPost {
    int uid;
    String username;
    String password;
    String email;
    String phone;
    String img;
    String type;
    String registeredDate;

    UserLoginPost({
        required this.uid,
        required this.username,
        required this.password,
        required this.email,
        required this.phone,
        required this.img,
        required this.type,
        required this.registeredDate,
    });

    factory UserLoginPost.fromJson(Map<String, dynamic> json) => UserLoginPost(
        uid: json["uid"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        phone: json["phone"],
        img: json["img"],
        type: json["type"],
        registeredDate: json["registered_date"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "password": password,
        "email": email,
        "phone": phone,
        "img": img,
        "type": type,
        "registered_date": registeredDate,
    };
}
