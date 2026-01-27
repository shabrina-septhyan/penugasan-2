import 'package:flutter/material.dart';
import 'package:tugas1/widgets/bottom_nav.dart';

class PesanView extends StatefulWidget {
  const PesanView({super.key});

  @override
  State<PesanView> createState() => _PesanViewState();
}

class _PesanViewState extends State<PesanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F6), // pink pastel
      appBar: AppBar(
        title: const Text("Pesan"),
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
                Icons.message_rounded,
                size: 60,
                color: Color(0xFFF48FB1),
              ),
              SizedBox(height: 14),
              Text(
                "Halaman Pesan 💬",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Belum ada pesan masuk",
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
