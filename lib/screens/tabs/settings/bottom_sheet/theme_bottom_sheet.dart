import 'package:flutter/material.dart';
import 'package:islami/themeing/mytheme.dart';
import 'package:provider/provider.dart';
import '../../../../provider/my_provider.dart';


class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

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
                  provider.changeTheme(ThemeMode.light);
                },
                child: Text(
                  "Light",
                  style: provider.themeMode == ThemeMode.light?
                  Theme.of(context).textTheme.displayLarge:Theme.of(context).textTheme.displaySmall
                ),
              ),
              if (provider.themeMode == ThemeMode.light) ...[
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
                  provider.changeTheme(ThemeMode.dark);
                },
                child: Text(
                  "Dark",
                  style: provider.themeMode == ThemeMode.dark?
                Theme.of(context).textTheme.displayLarge:Theme.of(context).textTheme.displaySmall

    ),
              ),
              if (provider.themeMode == ThemeMode.dark) ...[
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
