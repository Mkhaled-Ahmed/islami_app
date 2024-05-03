// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:islami/api_manger/api_manger.dart';
//
// import '../models/radio/radio_model.dart';
//
// class RadioProvider extends ChangeNotifier {
//   List<Radios> radios = [];
//   int index = 0;
//   bool isPlaying = false;
//
//   Future<void> getAllRadios() async {
//     try {
//       radios = await ApiManger.getAllRadio();
//       notifyListeners();
//     } catch (error) {
//       notifyListeners();
//     }
//   }
//
//   AudioPlayer audioPlayer = AudioPlayer();
//
//   Future<void> playAudio() async {
//     if(!isPlaying){
//       audioPlayer.pause();
//       await audioPlayer.play(UrlSource(radios[index].url??""));
//       isPlaying =true;
//       notifyListeners();
//     }
//   }
//
//   Future<void> pauseAudio() async {
//     if(isPlaying){
//       await audioPlayer.pause();
//       isPlaying=false;
//       notifyListeners();
//     }
//
//   }
//
//   playNext() async{
//     if (index < radios.length) {
//       await audioPlayer.pause();
//       index++;
//       await audioPlayer.play(UrlSource(radios[index].url??""));
//       notifyListeners();
//     }
//   }
//   playPrevious() async{
//     if (index > 0) {
//       await audioPlayer.pause();
//       index--;
//       await audioPlayer.play(UrlSource(radios[index].url??""));
//       notifyListeners();
//     }
//
//   }
//
//
//
// }


import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/api_manger/api_manger.dart';
import 'package:provider/provider.dart';

import '../models/radio/radio_model.dart';

class RadioProvider extends ChangeNotifier {
  List<Radios> radios = [];
  int index = 0;
  bool isPlaying = false;
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> getAllRadios() async {
    try {
      radios = await ApiManger.getAllRadio();
      if (radios.isNotEmpty) {
        index = 0; // Reset index to 0 to be safe
      }
      notifyListeners();
    } catch (error) {
      notifyListeners();
    }
  }

  void changeStation(bool isNext) {
    if (isNext) {
      if (index < radios.length - 1) {
        index++;
      }
    } else {
      if (index > 0) {
        index--;
      }
    }
    notifyListeners();
  }

  Future<void> togglePlay() async {
    if (isPlaying) {
      await audioPlayer.pause();
      isPlaying = false;
    } else {
      await audioPlayer.play(UrlSource(radios[index].url ?? ''));
      isPlaying = true;
    }
    notifyListeners();
  }
}
