import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas1/models/reponse_data_map.dart';
import 'package:tugas1/services/url.dart' as url;

class UserLogin {
  bool? status = false;
  String? token;
  String? message;
  int? id;
  String? nama_user;
  String? email;
  String? role;
  UserLogin({
    this.status,
    this.token,
    this.message,
    this.id,
    this.nama_user,
    this.email,
    this.role,
  });

  Future prefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserLogin userLogin = UserLogin();
    prefs.setBool("status", status!);
    prefs.setString("token", token!);
    prefs.setString("message", message!);
    prefs.setInt("id", id!);
    prefs.setString("nama_user", nama_user!);
    prefs.setString("email", email!);
    prefs.setString("role", role!);
  }

  Future getUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserLogin userLogin = UserLogin(
      status: prefs.getBool("status")!,
      token: prefs.getString("token")!,
      message: prefs.getString("message")!,
      id: prefs.getInt("id")!,
      nama_user: prefs.getString("nama_user")!,
      email: prefs.getString("email")!,
      role: prefs.getString("role")!,
    );
    return userLogin;
  }

  UserLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    message = json['message'];
    id = json['user']?['id'];
    nama_user = json['user']?['nama_user'];
    email = json['user']?['email'];
    role = json['user']?['role'];
  }
  
}
