import 'package:flutter/material.dart';
import 'package:latihan_kuis/profile_page.dart';
import 'package:latihan_kuis/save_button.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage(
      {super.key, required this.username, required this.opsional});
  final String username;
  final String? opsional;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _nameController = TextEditingController();
  final _nimController = TextEditingController();
  final _kerjaController = TextEditingController();
  final _organisasiController = TextEditingController();
  final _hardController = TextEditingController();
  final _softController = TextEditingController();
  final _pencapaianController = TextEditingController();

  void _saveData() {
    String nama = _nameController.text;
    String nim = _nimController.text;
    String kerja = _kerjaController.text;
    String organisasi = _organisasiController.text;
    String hard = _hardController.text;
    String soft = _softController.text;
    String pencapaian = _pencapaianController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        title: Text(
          'Selamat Datang, ${widget.opsional != null && widget.opsional!.isNotEmpty ? widget.opsional : widget.username}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //BUAT APA SAJA TEXTFIELDNYA
            _buildTextField(_nameController, 'Nama Lengkap', Icons.person),
            _buildTextField(_nimController, 'NIM', Icons.credit_card),
            _buildTextField(_kerjaController, 'Pengalaman Kerja', Icons.work),
            _buildTextField(
                _organisasiController, 'Pengalaman Organisasi', Icons.groups),
            _buildTextField(_hardController, 'Hard Skill', Icons.build),
            _buildTextField(_softController, 'Soft Skill', Icons.lightbulb),
            _buildTextField(_pencapaianController, 'Pencapaian/Penghargaan',
                Icons.emoji_events),
            const SizedBox(height: 20),

            //INI SAVE DATA
            SaveButton(
              onPressed: () {
                _saveData();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage(
                    name: _nameController.text,
                    nim: _nimController.text,
                    kerja: _kerjaController.text,
                    organisasi: _organisasiController.text,
                    hard: _hardController.text,
                    soft: _softController.text,
                    pencapaian: _pencapaianController.text,
                  );
                }));
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.teal),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
