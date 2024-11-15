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
          Expanded(
            child: Center(
              child: ListView(
                children: [
                  buildDoaCard(
                    title: "Doa Sebelum Tidur",
                    description: "بِاسْمِكَ رَبِّـي وَضَعْـتُ جَنْـبِي",
                    icon: Icons.nightlight_round,
                    color: Colors.green,
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
