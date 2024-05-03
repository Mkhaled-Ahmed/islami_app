import 'package:flutter/material.dart';
import 'package:islami/provider/sura_details_provider.dart';

import 'package:islami/models/surah/sura_model.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "SuraDetailsScreen";

  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraModel;
    var pro = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider<SuraDetailsProvider>(
      create: (context)=>SuraDetailsProvider()..loadFile(model.index),
      builder: (context,child){
        var provider = Provider.of<SuraDetailsProvider>(context);
        return Container(
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(pro.getBackgroundPath()),
                  fit: BoxFit.fill)),
          child: Scaffold(
            appBar: AppBar(
              title: Column(
                children: [
                  Text(model.name),
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
                          Text(provider.verses[index],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: provider.verses.length,
              ),
            ),
          ),
        );
      },
    );
  }
}
