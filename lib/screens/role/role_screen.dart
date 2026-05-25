import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F1F1),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            const SizedBox(height: 50),

            const Text(
              "Pilih Peran",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Pilih peran Anda untuk pengalaman terbaik",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            roleCard(
              title: "Saya Mencari Vendor",
              subtitle: "(Calon Pengantin)",
              image: "assets/images/bride.png",
            ),

            const SizedBox(height: 30),

            roleCard(
              title: "Saya Penyedia Jasa",
              subtitle: "(Vendor)",
              image: "assets/images/vendor.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget roleCard({
    required String title,
    required String subtitle,
    required String image,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 120,
          ),

          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          Text(subtitle),
        ],
      ),
    );
  }
}