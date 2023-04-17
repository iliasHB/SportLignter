import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class createUserModel {
  String id;
  final String name, email, phoneNo, password;

  createUserModel(
      {this.id = '',
        required this.phoneNo,
        required this.password,
        required this.email,
        required this.name,});
  Map<String, dynamic> toJson() => {
    'id': id,
    'phoneNo': phoneNo,
    'password': password,
    'email': email,
    'name': name,

  };
  factory createUserModel.fromJson(Map<String, dynamic> json){
    return createUserModel(
        id: json['id'],
        phoneNo: json['phoneNo'],
        password: json['password'],
        email: json['email'],
        name: json['name'],
    );
  }
  // static createUserModel fromJson(Map<String, dynamic> json) => createUserModel(
  //     id: json['id'],
  //     phoneNo: json['phoneNo'],
  //     password: json['password'],
  //     email: json['email'],
  //     name: json['name'],
  //     datetime: (json['datetime'] as Timestamp).toDate()
  // );

  factory createUserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options){
    final data = snapshot.data();
    return createUserModel(
        id: data?['id'],
        name: data?['name'],
        email: data?['email'],
        phoneNo: data?['phoneNo'],
        password: data?['password'],
    );

  }
  Map<String, dynamic> toFirestore() => {
    'id': id,
    'phoneNo': phoneNo,
    'password': password,
    'email': email,
    'name': name,
  };
}
