import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/home/tabs/ahadeth_tab.dart';
import 'package:islami/home/tabs/quran_tab.dart';
import 'package:islami/home/tabs/radio_tab.dart';
import 'package:islami/home/tabs/sebha_tab.dart';
import 'package:islami/home/tabs/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "إسلامي",
              style: GoogleFonts.elMessiri(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Color(0xFFB7935F),
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            elevation: 0,
            selectedItemColor: Colors.black38,
            unselectedItemColor: Colors.white,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/ic_quran.png")), label: "Quran"),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/ic_sebha.png")), label: "Sebha"),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/ic_radio.png")), label: "Radio"),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/ic_ahadeth.png")), label: "Ahadrth"),
              //BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/ic_qibla.png")), label: "Qibla"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "add"),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }
  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    AhadethTab(),
    RadioTab(),
    SettingsTab()
  ];
}
