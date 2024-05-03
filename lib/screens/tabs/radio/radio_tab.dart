// import 'package:flutter/material.dart';
// import 'package:islami/provider/radio_provider.dart';
// import 'package:provider/provider.dart';
//
// import '../../../provider/my_provider.dart';
//
// class RadioTab extends StatelessWidget {
//   const RadioTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var providerlanguage = Provider.of<MyProvider>(context);
//     return ChangeNotifierProvider(
//       create: (context) => RadioProvider()..getAllRadios(),
//       child: Consumer<RadioProvider>(
//         builder: (context, provider, child) {
//           return Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.2,
//               ),
//               Image.asset("assets/images/radio_image.png"),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.05,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: provider.radios.length,
//                   physics: const PageScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       child: Column(
//                         children: [
//                           Text(
//                             provider.radios[provider.index].name??"",
//                             style: TextStyle(
//                                 fontSize:
//                                     MediaQuery.of(context).size.width * 0.06),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.04,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               if (providerlanguage.languageCode == "ar") ...[
//                                 IconButton(
//                                     onPressed: () async {
//                                       if (!provider.isPlaying) {
//                                         await provider.pauseAudio();
//                                       } else {
//                                         await provider.playNext();
//                                       }
//                                     },
//                                     icon: Icon(
//                                       Icons.skip_next,
//                                       color: Theme.of(context).dividerColor,
//                                       size: MediaQuery.of(context).size.height *
//                                           0.07,
//                                     )),
//                               ],
//                               if (providerlanguage.languageCode == "en") ...[
//                                 IconButton(
//                                     onPressed: () async {
//                                       if (!provider.isPlaying) {
//                                         await provider.pauseAudio();
//                                       } else {
//                                         await provider.playNext();
//                                       }
//                                     },
//                                     icon: Icon(
//                                       Icons.skip_previous,
//                                       color: Theme.of(context).dividerColor,
//                                       size: MediaQuery.of(context).size.height *
//                                           0.07,
//                                     )),
//                               ],
//                               IconButton(
//                                 onPressed: () async {
//                                   if (provider.isPlaying) {
//                                     await provider.pauseAudio();
//                                   } else {
//                                     await provider.playAudio();
//                                   }
//                                 },
//                                 icon: Icon(
//                                   provider.isPlaying
//                                       ? Icons.pause
//                                       : Icons.play_arrow,
//                                   color: Theme.of(context).dividerColor,
//                                   size:
//                                       MediaQuery.of(context).size.height * 0.07,
//                                 ),
//                               ),
//                               if (providerlanguage.languageCode == "ar") ...[
//                                 IconButton(
//                                   onPressed: () async {
//                                     if (!provider.isPlaying) {
//                                       await provider.pauseAudio();
//                                     } else {
//                                       await provider.playPrevious();
//                                     }
//                                   },
//                                   icon: Icon(
//                                     Icons.skip_previous,
//                                     color: Theme.of(context).dividerColor,
//                                     size: MediaQuery.of(context).size.height *
//                                         0.07,
//                                   ),
//                                 ),
//                               ],
//                               if (providerlanguage.languageCode == "en") ...[
//                                 IconButton(
//                                   onPressed: () async {
//                                     if (!provider.isPlaying) {
//                                       await provider.pauseAudio();
//                                     } else {
//                                       await provider.playPrevious();
//                                     }
//                                   },
//                                   icon: Icon(
//                                     Icons.skip_next,
//                                     color: Theme.of(context).dividerColor,
//                                     size: MediaQuery.of(context).size.height *
//                                         0.07,
//                                   ),
//                                 ),
//                               ],
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/radio_provider.dart';


class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RadioProvider()..getAllRadios(),
      child: Consumer<RadioProvider>(
        builder: (context, provider, child) {
          String radioName = 'Loading...';
          if (provider.radios.isNotEmpty && provider.index >= 0 && provider.index < provider.radios.length) {
            radioName = provider.radios[provider.index].name ?? 'No Name';
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/radio_image.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),
              Text(
                radioName,
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_previous,size: 40,color: Theme.of(context).dividerColor,),
                    onPressed: provider.radios.isNotEmpty ? () => provider.changeStation(false) : null,
                  ),
                  IconButton(
                    icon: Icon(provider.isPlaying ? Icons.pause : Icons.play_arrow,size: 40,color: Theme.of(context).dividerColor,),
                    onPressed: provider.radios.isNotEmpty ? provider.togglePlay : null,
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_next,size: 40,color: Theme.of(context).dividerColor),
                    onPressed: provider.radios.isNotEmpty ? () => provider.changeStation(true) : null,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}


