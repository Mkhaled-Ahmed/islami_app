import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier{

  int counter = 0;
  int index = 0;
  double angle =0;
  List<String> tasbehList = ['سبحان الله', 'الحمد الله', 'الله أكبر'];

  void tasbeh(){
    if(counter<33){
      angle += 0.7;
      counter++;
    }
    else{
      if(index<2){
        index++;
        counter=0;
      }
      else{
        index=0;
        counter=0;
      }
    }
    notifyListeners();
  }
}