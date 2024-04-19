import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivetodo/core/constants/colorconstant/color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../repository/model/model.dart';

class mydialog extends StatefulWidget {

  final ValueChanged<Color> onColorSelected;
  VoidCallback onsave;
  final controller;
  VoidCallback onyellow;
  VoidCallback ongreen;
  VoidCallback onred;

  mydialog({
    super.key,
    required this.onsave,
    required this.controller,
    required this.ongreen,
    required this.onred,
    required this.onyellow,
    required this.onColorSelected,
  });

  @override
  State<mydialog> createState() => _mydialogState();
}

class _mydialogState extends State<mydialog> {
  final _myBox = Hive.box("myBox");
  Tododatabase db = Tododatabase();
static Color selectedcolor = colour.color4;
  void initState() {
    if (_myBox.get("tododatabase") == null) {
      db.initialdata();
    } else {
      db.loaddata();
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
      content: Container(
        width: width * .75,
        height: 220,
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add Task"),
              style: TextStyle(color:Colors.black),
            ),
            Text("Select Colour"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  minWidth: width * .2,
                  color: Colors.yellow,
                  onPressed: () {
                    setState(() {
                      selectedcolor = Colors.yellow;
                    });
                    widget.onColorSelected(selectedcolor);
                    db.updatedata();
                  },
                  shape: StadiumBorder(),
                  child: Text("Yellow"),
                ),
                //SizedBox(width: 1,),
                MaterialButton(
                  minWidth: width * .2,
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      selectedcolor = Colors.green;
                    });
                    widget.onColorSelected(selectedcolor);
                    db.updatedata();
                  },
                  shape: StadiumBorder(),
                  child: Text("Green"),
                ),
                // SizedBox(width: 1,),
                MaterialButton(
                  minWidth: width * .2,
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      selectedcolor = Colors.red;
                    });
                    widget.onColorSelected(selectedcolor);
                    db.updatedata();
                  },
                  shape: StadiumBorder(),
                  child: Text("Red"),
                )
              ],
            ),
            Row(
              children: [
                MaterialButton(
                    shape: StadiumBorder(),
                    onPressed: widget.onsave,
                    child: Text(
                      "save",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: colour.color2),
                SizedBox(
                  width: 25,
                ),
                MaterialButton(
                    shape: StadiumBorder(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                        Text("cancel", style: TextStyle(color: Colors.white)),
                    color: colour.color2)
              ],
            )
          ],
        )),
      ),
    );
  }
}

//
// // mydialog.dart
// import 'package:flutter/material.dart';
//
// class mydialog extends StatefulWidget {
//   final VoidCallback onsave;
//   final TextEditingController controller;
//   final VoidCallback onyellow;
//   final VoidCallback ongreen;
//   final VoidCallback onred;
//   final ValueChanged<Color> onColorSelected; // New callback function
//
//   mydialog({
//     Key? key,
//     required this.onsave,
//     required this.controller,
//     required this.ongreen,
//     required this.onred,
//     required this.onyellow,
//     required this.onColorSelected, // Receive the callback function
//   }) : super(key: key);
//
//   @override
//   State<mydialog> createState() => mydialogState();
// }
//
// class mydialogState extends State<mydialog> {
//   Color selectedColor = Colors.black;
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return AlertDialog(
//       content: Container(
//         width: width * .75,
//         height: 220,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             TextField(
//               controller: widget.controller,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Add Task",
//               ),
//               style: TextStyle(color: selectedColor),
//             ),
//             Text("Select Colour"),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 MaterialButton(
//                   minWidth: width * .2,
//                   color: Colors.yellow,
//                   onPressed: () {
//                     _selectColor(Colors.yellow);
//                   },
//                   shape: StadiumBorder(),
//                   child: Text("Yellow"),
//                 ),
//                 MaterialButton(
//                   minWidth: width * .2,
//                   color: Colors.green,
//                   onPressed: () {
//                     _selectColor(Colors.green);
//                   },
//                   shape: StadiumBorder(),
//                   child: Text("Green"),
//                 ),
//                 MaterialButton(
//                   minWidth: width * .2,
//                   color: Colors.red,
//                   onPressed: () {
//                     _selectColor(Colors.red);
//                   },
//                   shape: StadiumBorder(),
//                   child: Text("Red"),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 MaterialButton(
//                   shape: StadiumBorder(),
//                   onPressed: widget.onsave,
//                   child: Text(
//                     "save",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   color: Colors.blue, // Change to desired color
//                 ),
//                 SizedBox(width: 25),
//                 MaterialButton(
//                   shape: StadiumBorder(),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("cancel", style: TextStyle(color: Colors.white)),
//                   color: Colors.blue, // Change to desired color
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _selectColor(Color color) {
//     setState(() {
//       selectedColor = color;
//     });
//     widget.onColorSelected(selectedColor); // Call the callback function
//   }
// }

///nree
///

// mydialog.dart
//
// import 'package:flutter/material.dart';
// import 'package:hivetodo/core/constants/colorconstant/color.dart';
//
// class mydialog extends StatefulWidget {
//   VoidCallback onsave;
//   final TextEditingController controller;
//   VoidCallback onyellow;
//   VoidCallback ongreen;
//   VoidCallback onred;
//   final ValueChanged<Color> onColorSelected;
//
//   mydialog({
//     super.key,
//     required this.onsave,
//     required this.controller,
//     required this.ongreen,
//     required this.onred,
//     required this.onyellow,
//     required this.onColorSelected,
//   });
//
//   @override
//   State<mydialog> createState() => _mydialogState();
// }
//
// class _mydialogState extends State<mydialog> {
//   Color selectedcolor = Colors.black;
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return AlertDialog(
//       content: Container(
//         width: width * .75,
//         height: 220,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             TextField(
//               controller: widget.controller,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Add Task",
//               ),
//               style: TextStyle(color: selectedcolor),
//             ),
//             Text("Select Colour"),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 MaterialButton(
//                   minWidth: width * .2,
//                   color: Colors.yellow,
//                   onPressed: () {
//                     _selectColor(Colors.yellow);
//                   },
//                   shape: StadiumBorder(),
//                   child: Text("Yellow"),
//                 ),
//                 MaterialButton(
//                   minWidth: width * .2,
//                   color: Colors.green,
//                   onPressed: () {
//                     _selectColor(Colors.green);
//                   },
//                   shape: StadiumBorder(),
//                   child: Text("Green"),
//                 ),
//                 MaterialButton(
//                   minWidth: width * .2,
//                   color: Colors.red,
//                   onPressed: () {
//                     _selectColor(Colors.red);
//                   },
//                   shape: StadiumBorder(),
//                   child: Text("Red"),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 MaterialButton(
//                   shape: StadiumBorder(),
//                   onPressed: widget.onsave,
//                   child: Text(
//                     "save",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   color: colour.color2,
//                 ),
//                 SizedBox(width: 25),
//                 MaterialButton(
//                   shape: StadiumBorder(),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("cancel", style: TextStyle(color: Colors.white)),
//                   color: colour.color2,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _selectColor(Color color) {
//     setState(() {
//       selectedcolor = color;
//     });
//     widget.onColorSelected(selectedcolor);
//   }
// }
//
