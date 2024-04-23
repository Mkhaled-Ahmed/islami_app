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
          appBar: AppBar(
            title: Text(
              "إسلامي",
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: const [
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
    const SebhaTab(),
    const AhadethTab(),
    const RadioTab(),
    const SettingsTab()
  ];
}
