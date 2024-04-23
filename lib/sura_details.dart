import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:islami/sura_model.dart';
import 'package:islami/to_arabic_no_converter.dart';
import 'package:quran/quran.dart' as quran;


class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";


  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(model.index);
    }

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
         appBar: AppBar(
          title: Column(
            children: [
              Text(
                model.name
              ),
            ],
          ),
        ),
        body: Card(
          margin: const EdgeInsets.all(12),
          elevation: 12,
          color: Colors.white.withOpacity(.9),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Colors.transparent)),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.all(7),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        verses[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall
                      ),
                      Text(
                        "\uFD3E${(index + 1).toString().toArabicNumbers}\uFD3F",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: 'me_quran',
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                offset: Offset(.5, .5),
                                blurRadius: 1.0,
                                color: Colors.amberAccent,
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: verses.length,
          ),
        ),

      ),
    );
  }

  Future<void> loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split("\n");
    verses = lines;
    setState(() {});
  }
}
