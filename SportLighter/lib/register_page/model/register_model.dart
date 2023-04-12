import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class createUserModel {
  String id;
  final String name, email, phoneNo, password;
  final DateTime datetime;
  createUserModel(
      {this.id = '',
        required this.phoneNo,
        required this.password,
        required this.email,
        required this.name,
        required this.datetime});
  Map<String, dynamic> toJson() => {
    'id': id,
    'phoneNo': phoneNo,
    'password': password,
    'email': email,
    'name': name,
    'datetime': datetime
  };

  static createUserModel fromJson(Map<String, dynamic> json) => createUserModel(
      id: json['id'],
      phoneNo: json['phoneNo'],
      password: json['password'],
      email: json['email'],
      name: json['name'],
      datetime: (json['datetime'] as Timestamp).toDate()
  );
}
