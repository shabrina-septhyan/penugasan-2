import 'package:flutter/material.dart';
import 'package:tugas1/widgets/bottom_nav.dart';

class TokoView extends StatelessWidget {
  const TokoView({super.key});

  // ================== DATA PRODUK ==================
  final List<Map<String, dynamic>> products = const [
    {
      "nama": "Barbie Fashion Blue",
      "harga": "Rp104.900",
      "gambar": "assets/barbie biru.png",
      "description": "Barbie dengan gaun biru cantik",
    },
    {
      "nama": "Barbie Pink Dress",
      "harga": "Rp94.900",
      "gambar": "assets/barbie1.png",
      "description": "Barbie dengan gaun pink cantik",
    },
    {
      "nama": "Barbie Ballerina",
      "harga": "Rp143.900",
      "gambar": "assets/barbie2.png",
      "description": "Barbie ballet cantik",
    },
    {
      "nama": "Barbie Doctor",
      "harga": "Rp332.900",
      "gambar": "assets/barbie4.png",
      "description": "Barbie dokter cantik",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===== BACKGROUND GRADIENT =====
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF1F6),
              Color(0xFFFFE4EE),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ===== APP BAR CUSTOM =====
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: const BoxDecoration(
                  color: Color(0xFFF48FB1),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(18),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Toko Barbie",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // ===== GRID PRODUK =====
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.62,
                    ),
                    itemBuilder: (context, index) {
                      return _productCard(products[index], index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNav(2),
    );
  }

  // ================== CARD PRODUK ==================
  Widget _productCard(Map<String, dynamic> product, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== FOTO + BADGE =====
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(14)),
                  child: Image.asset(
                    product["gambar"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF48FB1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    index == 0 ? "BEST SELLER" : "NEW",
                    style: const TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ===== INFO =====
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product["nama"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  product["harga"],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF48FB1),
                  ),
                ),
                const SizedBox(height: 8),

                // ===== BUTTON =====
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFE4EE),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Detail",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFF48FB1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
