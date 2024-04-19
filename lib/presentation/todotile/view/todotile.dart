import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hivetodo/core/constants/colorconstant/color.dart';

class todotile extends StatefulWidget {
  Function(bool?)? onChanged;
  final bool taskcompleted;
  final String taskname;

// final Color selectedColor;
  Function(BuildContext)? deletefunction;

  final Color selectedColor;

  todotile({
    super.key,
    required this.onChanged,
    required this.taskcompleted,
    required this.taskname,
    required this.deletefunction,
    required this.selectedColor,
    // required this.selectedColor
  });

  @override
  State<todotile> createState() => _todotileState();
}

class _todotileState extends State<todotile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: widget.deletefunction,
            icon: Icons.delete,
            backgroundColor: colour.redcolor,
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: widget.selectedColor,
          ),
          child: Row(
            children: [
              Checkbox(
                value: widget.taskcompleted,
                onChanged: widget.onChanged,
                activeColor: Colors.black,
              ),
              Text(widget.taskname,
                  style: TextStyle(
                    color: Colors.black,
                    decoration: widget.taskcompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

///newew
///
// todotile.dart
//
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:hivetodo/core/constants/colorconstant/color.dart';
//
// class todotile extends StatelessWidget {
//   Function(bool?)? onChanged;
//   final bool taskcompleted;
//   final String taskname;
//   final Color selectedColor;
//   Function(BuildContext)? deletefunction;
//
//   todotile({
//     super.key,
//     required this.onChanged,
//     required this.taskcompleted,
//     required this.taskname,
//     required this.deletefunction,
//     required this.selectedColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Slidable(
//         endActionPane: ActionPane(motion: StretchMotion(), children: [
//           SlidableAction(
//             onPressed: deletefunction,
//             icon: Icons.delete,
//             backgroundColor: colour.redcolor,
//           ),
//         ]),
//         child: Container(
//           padding: EdgeInsets.all(18),
//           decoration: BoxDecoration(
//             color: colour.color4,
//           ),
//           child: Row(
//             children: [
//               Checkbox(
//                 value: taskcompleted,
//                 onChanged: onChanged,
//                 activeColor: Colors.black,
//               ),
//               Text(
//                 taskname,
//                 style: TextStyle(
//                   color: selectedColor,
//                   decoration: taskcompleted
//                       ? TextDecoration.lineThrough
//                       : TextDecoration.none,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
