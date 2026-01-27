import 'package:flutter/material.dart';
import 'package:tugas1/views/dashboard.dart';
import 'package:tugas1/views/login_view.dart';
import 'package:tugas1/views/pesan_view.dart';
import 'package:tugas1/views/register_user_views.dart';
import 'package:tugas1/views/toko_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => const RegisterUserView(),
      '/login':(context) => const LoginView(),
      '/dashboard':(context) => const DashboardView(),
      '/toko':(context) => const TokoView(),
      '/pesan':(context) => const PesanView(),
    },
  ));
}

