import 'package:flutter/material.dart';

class WaktuPage extends StatelessWidget {
  final List<Map<String, String>> waktuSholat = [
    {"nama": "Shubuh", "waktu": "04:07"},
    {"nama": "Dzuhur", "waktu": "12:00"},
    {"nama": "Ashar", "waktu": "15:30"},
    {"nama": "Maghrib", "waktu": "18:00"},
    {"nama": "Isya", "waktu": "19:30"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Waktu Sholat", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[600],
      ),
      body: ListView.builder(
        itemCount: waktuSholat.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(
                Icons.access_time_filled,
                color: Colors.green[700],
              ),
              title: Text(
                waktuSholat[index]['nama']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                waktuSholat[index]['waktu']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
