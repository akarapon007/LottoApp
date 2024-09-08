// To parse this JSON data, do
//
//     final userLoginPostRes = userLoginPostResFromJson(jsonString);

import 'dart:convert';

UserLoginPostRes userLoginPostResFromJson(String str) => UserLoginPostRes.fromJson(json.decode(str));

String userLoginPostResToJson(UserLoginPostRes data) => json.encode(data.toJson());

class UserLoginPostRes {
    bool success;
    User user;

    UserLoginPostRes({
        required this.success,
        required this.user,
    });

    factory UserLoginPostRes.fromJson(Map<String, dynamic> json) => UserLoginPostRes(
        success: json["success"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "user": user.toJson(),
    };
}

class User {
    int uid;
    String username;
    String password;
    String email;
    String phone;
    String type;
    String registeredDate;
    int balance;

    User({
        required this.uid,
        required this.username,
        required this.password,
        required this.email,
        required this.phone,
        required this.type,
        required this.registeredDate,
        required this.balance,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        phone: json["phone"],
        type: json["type"],
        registeredDate: json["registered_date"],
        balance: json["balance"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "password": password,
        "email": email,
        "phone": phone,
        "type": type,
        "registered_date": registeredDate,
        "balance": balance,
    };
}
