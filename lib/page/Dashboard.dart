import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:adhan/adhan.dart';
import 'package:projectuts/page/Doa.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Map<String, DateTime> waktuBerdoa;
  String currentTime = '';
  String namaShalatSelanjutnya = '';
  String waktuSelanjutnya = '';
  Timer? _timer;

  // List untuk data jadwal shalat (contoh data)
  final List<Map<String, String>> jadwalShalat = [
    {'nama': 'Shubuh', 'waktu': '04:30'},
    {'nama': 'Dzuhur', 'waktu': '12:00'},
    {'nama': 'Ashar', 'waktu': '15:15'},
    {'nama': 'Maghrib', 'waktu': '18:00'},
    {'nama': 'Isya', 'waktu': '19:15'},
  ];

  void _updateTime() {
    if (mounted) {
      setState(() {
        currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
      });
    }
  }

  void _waktuSelanjutnya() {
    final coordinates = Coordinates(-6.6412, 107.7636);
    final param = CalculationMethod.muslim_world_league.getParameters();
    final selanjutnyaHariIni = PrayerTimes.today(coordinates, param);

    waktuBerdoa = {
      'Shubuh': selanjutnyaHariIni.fajr,
      'Dhuhur': selanjutnyaHariIni.dhuhr,
      'Ashar': selanjutnyaHariIni.asr,
      'Maghrib': selanjutnyaHariIni.maghrib,
      'Isya': selanjutnyaHariIni.isha,
    };
    _findNextPrayer();
  }

  void _findNextPrayer() {
    final now = DateTime.now();
    DateTime? upcomingPrayerTime;
    String? upcomingPrayerName;

    if (now.isAfter(waktuBerdoa['Isya']!)) {
      final coordinates = Coordinates(-6.6412, 107.7636);
      final param = CalculationMethod.muslim_world_league.getParameters();
      final selanjutnyaHariIni = PrayerTimes.today(coordinates, param);

      final shubuhBesok = DateTime(now.year, now.month, now.day + 1,
          selanjutnyaHariIni.fajr.hour, selanjutnyaHariIni.fajr.minute);

      waktuBerdoa = {
        'Shubuh': shubuhBesok,
        'Dhuhur': DateTime(now.year, now.month, now.day + 1,
            selanjutnyaHariIni.dhuhr.hour, selanjutnyaHariIni.dhuhr.minute),
        'Ashar': DateTime(now.year, now.month, now.day + 1,
            selanjutnyaHariIni.asr.hour, selanjutnyaHariIni.asr.minute),
        'Maghrib': DateTime(now.year, now.month, now.day + 1,
            selanjutnyaHariIni.maghrib.hour, selanjutnyaHariIni.maghrib.minute),
        'Isya': DateTime(now.year, now.month, now.day + 1,
            selanjutnyaHariIni.isha.hour, selanjutnyaHariIni.isha.minute),
      };
    }

    for (var entry in waktuBerdoa.entries) {
      if (entry.value.isAfter(now)) {
        upcomingPrayerTime = entry.value;
        upcomingPrayerName = entry.key;
        break;
      }
    }

    if (mounted) {
      setState(() {
        if (upcomingPrayerTime != null && upcomingPrayerName != null) {
          waktuSelanjutnya = DateFormat('HH:mm').format(upcomingPrayerTime!);
          namaShalatSelanjutnya = upcomingPrayerName ?? 'Tidak ada';
        } else {
          waktuSelanjutnya = 'N/A';
          namaShalatSelanjutnya = 'Tidak ada shalat lagi hari ini';
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _updateTime();
    _waktuSelanjutnya();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF03AB03),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Header Container
          Container(
            height: 140,
            width: double.infinity,
            color: Color(0xFF03AB03),
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sekarang: $currentTime',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$namaShalatSelanjutnya : $waktuSelanjutnya',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: Image.asset(
                      'asset/Mosque.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // expand 1
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 78, 255, 29),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.headset_mic_outlined,
                        size: 50,
                      ),
                      Text(
                        "Islamic Music",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 173, 173, 173),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.menu_book,
                        size: 50,
                      ),
                      Text(
                        "Alquran/Murotal",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // expand 2
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jadwal Shalat Hari Ini",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: jadwalShalat.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          margin: EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: Icon(Icons.access_time,
                                color: Color(0xFF03AB03)),
                            title: Text(jadwalShalat[index]['nama']!),
                            trailing: Text(
                              jadwalShalat[index]['waktu']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF03AB03),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
