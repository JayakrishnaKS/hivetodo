import 'package:flutter/material.dart';
import 'package:hivetodo/core/constants/colorconstant/color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class mydialog extends StatelessWidget {
  VoidCallback onsave;
  final controller;


  mydialog({super.key, required this.onsave, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add Task"),
            ),
            Row(
              children: [
                MaterialButton(
                    shape: StadiumBorder(),
                    onPressed: onsave,
                    child: Text(
                      "save",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: colour.color2),
                SizedBox(
                  width: 15,
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

  deletefunction() {}
}
