import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SettingPage> {
  final List<Map<String, dynamic>> pengaturan = [
    {
      "Nama": "pengaturan",
      "icon": Icons.settings,
    },
    {
      "Nama": "Pusat Privasi",
      "icon": Icons.privacy_tip,
    },
    {
      "Nama": "Keamanan",
      "icon": Icons.security,
    },
    {
      "Nama": "Kotak Masukan Dukungan",
      "icon": Icons.support_agent_outlined,
    },
    {
      "Nama": "Laporkan Masalah",
      "icon": Icons.report_problem_rounded,
    },
    {
      "Nama": "Pusat Bantuan",
      "icon": Icons.help_center_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengaturan",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 146, 146, 146),
      ),
      body: ListView.builder(
          itemCount: pengaturan.length,
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(
                  pengaturan[index]["icon"],
                  color: Colors.grey,
                ),
                title: Text(
                  pengaturan[index]["Nama"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            );
          }),
    );
  }
}
