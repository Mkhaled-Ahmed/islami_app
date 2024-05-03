import 'package:flutter/material.dart';
import 'package:islami/themeing/mytheme.dart';


import 'package:provider/provider.dart';
import '../../../../provider/my_provider.dart';


class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  provider.changeLanguage("en");
                },
                child: Text(
                  "English",
                  style: provider.languageCode == "en"?
                      Theme.of(context).textTheme.displayLarge:Theme.of(context).textTheme.displaySmall
                ),
              ),
              if (provider.languageCode=="en") ...[
                const Icon(
                  Icons.done,
                  size: 35,
                  color: MyThemeData.primaryColor,
                )
              ],
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  provider.changeLanguage("ar");
                },
                child: Text(
                  "Arabic",
                  style: provider.languageCode == "ar"?
                  Theme.of(context).textTheme.displayLarge:Theme.of(context).textTheme.displaySmall
                ),
              ),
              if (provider.languageCode == "ar") ...[
                const Icon(
                  Icons.done,
                  size: 35,
                  color: MyThemeData.primaryColor,
                )
              ],
            ],
          ),
        ],
      ),
    );
  }
}
