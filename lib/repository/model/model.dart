import 'package:hive/hive.dart';

class Tododatabase{
  List  list=[];
final _myBox=Hive.box("myBox");
///initialiazez the list to be pronted in the homescreen
void initialdata(){
  list=[[
    "Mwona",false
  ],["makane",false]];
}
/// toloadthe data from the list
void loaddata(){
  list=_myBox.get("tododatabase");     /// todatabase is A KEY TO refer in the homescreen
}
/// to store the updates of hive box from the currentlist
void updatedata(){
  _myBox.put("tododatabase", list);
}
}