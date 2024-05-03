import 'package:flutter/material.dart';
import 'package:islami/screens/tabs/settings/bottom_sheet/language_bottom_sheet.dart';
import 'package:islami/screens/tabs/settings/bottom_sheet/theme_bottom_sheet.dart';
import 'package:islami/themeing/mytheme.dart';
import 'package:provider/provider.dart';
import '../../../provider/my_provider.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Language",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: const LanguageBottomSheet(),
                    );
                  });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: MyThemeData.lightPrimaryColor),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                provider.languageCode=="en"?"English":"Arabic",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            "Theme",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: const ThemeBottomSheet(),
                    );
                  });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: MyThemeData.lightPrimaryColor),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                provider.themeMode==ThemeMode.light?"Light":"Dark",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
