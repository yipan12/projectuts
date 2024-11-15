import 'package:flutter/material.dart';
import 'package:projectuts/page/Dashboard.dart';
import 'package:projectuts/page/Doa.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    DashboardPage(),
    DoaPage(),
    Center(child: Text("Waktu Page")),
    Center(child: Text("Waktu Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.menu_book),
            title: Text("Doa"),
            selectedColor: Colors.pink[300],
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.timer),
            title: Text("Waktu"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
