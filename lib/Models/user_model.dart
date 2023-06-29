import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  UserModel({required this.id,required this.email,required this.first_name,required this.last_name,required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] ?? 1,
        email: json['email'] ?? "Email",
        first_name: json['first_name'] ?? "First name",
        last_name: json['last_name'] ?? "Last name",
        avatar: json['avatar'] ?? "Avatar"
    );
  }
}
