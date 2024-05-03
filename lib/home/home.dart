import 'package:flutter/material.dart';
import 'package:islami/screens/tabs/qibla/qibla_tab.dart';
import 'package:islami/screens/tabs/quran/quran_tab.dart';
import 'package:islami/screens/tabs/radio/radio_tab.dart';
import 'package:islami/screens/tabs/record/record_tab.dart';
import 'package:islami/screens/tabs/sebha/sebha_tab.dart';
import 'package:islami/screens/tabs/settings/setting_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:provider/provider.dart';


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
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.getBackgroundPath(),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title:  Text(
                AppLocalizations.of(context)!.app_name,style: Theme.of(context).textTheme.bodyMedium,
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
              BottomNavigationBarItem(icon: Icon(Icons.mosque), label: "Qibla"),
              BottomNavigationBarItem(icon: Icon(Icons.camera), label: "record"),
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
    const RadioTab(),
    const QiblaTab(),
    const RecordTab(),
    const SettingTab()
  ];
}
