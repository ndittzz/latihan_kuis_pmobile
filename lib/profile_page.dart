import 'package:flutter/material.dart';
import 'package:latihan_kuis/login_page.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String nim;
  final String kerja;
  final String organisasi;
  final String hard;
  final String soft;
  final String pencapaian;

  const ProfilePage({
    super.key,
    required this.name,
    required this.nim,
    required this.kerja,
    required this.organisasi,
    required this.hard,
    required this.soft,
    required this.pencapaian,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ubah background menjadi putih

      appBar: AppBar(
        title: const Text('Profil', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueAccent, // Warna sesuai gambar
              backgroundImage: AssetImage('assets/images/kucing.jpg'),
            ),
            const SizedBox(height: 20),

            // List Info
            Expanded(
              child: ListView(
                children: [
                  _buildInfoCard("Nama", name),
                  _buildInfoCard("NIM", nim),
                  _buildInfoCard("Pengalaman Kerja", kerja),
                  _buildInfoCard("Pengalaman Organisasi", organisasi),
                  _buildInfoCard("Hard Skill", hard),
                  _buildInfoCard("Soft Skill", soft),
                  _buildInfoCard("Pencapaian", pencapaian),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Logout
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Warna merah sesuai gambar
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Membuat tombol oval
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade100, // Warna abu-abu muda
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              value.isNotEmpty ? value : 'Tidak ada data',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
