import 'package:flutter/material.dart';
import 'package:tugas1/widgets/bottom_nav.dart';

class TokoView extends StatefulWidget {
  const TokoView({super.key});

  @override
  State<TokoView> createState() => _TokoViewState();
}

class _TokoViewState extends State<TokoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F6), // pink pastel
      appBar: AppBar(
        title: const Text("Toko"),
        backgroundColor: const Color(0xFFF48FB1),
        foregroundColor: Colors.white,
      ),

      // BODY
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.18),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.store_rounded,
                size: 60,
                color: Color(0xFFF48FB1),
              ),
              SizedBox(height: 14),
              Text(
                "Halaman Toko 🛍️",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Fitur toko akan segera tersedia",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),

      // BOTTOM NAV
      bottomNavigationBar: BottomNav(1),
    );
  }
}
