import 'package:flutter/material.dart';

class DoaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doa", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink[300],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildDoaCard(
            context,
            "Doa Sebelum Makan",
            "اللَّهُمَّ بَارِكْ لَنَا فِيمَا رَزَقْتَنَا وَقِنَا عَذَابَ النَّارِ",
            "Ya Allah, berkahilah kami pada rezeki yang telah Engkau berikan dan jauhkanlah kami dari azab neraka.",
          ),
          SizedBox(height: 16),
          _buildDoaCard(
            context,
            "Doa Setelah Makan",
            "الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِينَ",
            "Segala puji bagi Allah yang telah memberi makan dan minum kepada kami serta menjadikan kami termasuk orang-orang Muslim.",
          ),
          SizedBox(height: 16),
          _buildDoaCard(
            context,
            "Doa Sebelum Tidur",
            "بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا",
            "Dengan nama-Mu, ya Allah, aku mati dan aku hidup.",
          ),
          SizedBox(
            height: 16,
          ),
          _buildDoaCard(
              context,
              "Lafal Niat Wudhu",
              "نَوَيْتُ الْوُضُوْءَ لِرَفْعِ الْحَدَثِ الْأَصْغَرِ فَرْضًا لِلّٰهِ تَعَالَى",
              "Saya niat berwudhu untuk menghilangkan hadats kecil, fardhu karena Allah Ta‘la")
        ],
      ),
    );
  }

  Widget _buildDoaCard(BuildContext context, String title, String arabicText,
      String translation) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              arabicText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 8),
            Text(
              translation,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
