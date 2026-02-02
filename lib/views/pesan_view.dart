import 'package:flutter/material.dart';
import 'package:tugas1/widgets/bottom_nav.dart';

class PesanView extends StatelessWidget {
  const PesanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F6),
      appBar: AppBar(
        title: const Text("Pesanan Saya"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),

      body: Column(
        children: [
          // ===== TAB =====
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _TabItem("Dikemas", false),
                _TabItem("Dikirim", false),
                _TabItem("Selesai", true),
                _TabItem("Pengembalian", false),
              ],
            ),
          ),

          // ===== LIST PESANAN =====
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [
                _OrderCard(
                  toko: "Samsara OneStop",
                  gambar: "assets/produk1.png",
                  namaProduk: "Kartu Printable inkjet id card blueprint",
                  jumlah: 2,
                  harga: "Rp53.998",
                  total: "Rp107.836",
                ),
                SizedBox(height: 12),
                _OrderCard(
                  toko: "Global Kartu",
                  gambar: "assets/produk2.png",
                  namaProduk: "LANYARD PRINTING CUSTOM",
                  jumlah: 65,
                  harga: "Rp9.100",
                  total: "Rp525.420",
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNav(1),
    );
  }
}

// ================= TAB =================
class _TabItem extends StatelessWidget {
  final String title;
  final bool active;

  const _TabItem(this.title, this.active);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: TextStyle(
              color: active ? const Color(0xFFF48FB1) : Colors.black54,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        if (active)
          Container(
            height: 3,
            width: 30,
            color: const Color(0xFFF48FB1),
          ),
      ],
    );
  }
}

// ================= CARD PESANAN =================
class _OrderCard extends StatelessWidget {
  final String toko;
  final String gambar;
  final String namaProduk;
  final int jumlah;
  final String harga;
  final String total;

  const _OrderCard({
    required this.toko,
    required this.gambar,
    required this.namaProduk,
    required this.jumlah,
    required this.harga,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TOKO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                toko,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                "Selesai",
                style: TextStyle(color: Color(0xFFF48FB1)),
              ),
            ],
          ),
          const Divider(),

          // PRODUK
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  gambar,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaProduk,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text("x$jumlah"),
                  ],
                ),
              ),
              Text(harga),
            ],
          ),

          const SizedBox(height: 10),

          // TOTAL
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Total $jumlah produk: $total",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 10),

          // BUTTON
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text("Lihat Penilaian"),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF48FB1),
                ),
                onPressed: () {},
                child: const Text("Beli Lagi"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
