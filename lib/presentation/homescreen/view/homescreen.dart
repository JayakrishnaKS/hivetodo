import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:hivetodo/core/constants/colorconstant/color.dart';
import 'package:hivetodo/presentation/refractordialog/view/mydialog.dart';
import 'package:hivetodo/repository/model/model.dart';

import '../../todotile/view/todotile.dart';

class homescreen extends StatefulWidget {


  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  void initState() {
    if(_myBox.get("tododatabase")==null){
      db.initialdata();
    }else{
      db.loaddata();
    }
    // TODO: implement initState
    super.initState();
  }
  Tododatabase db=Tododatabase();
  final _myBox=Hive.box("myBox");
  final _controller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onclick(index ) {

      setState(() {
        db.list[index][1]=!db.list[index][1];



      });

    }
    return Scaffold(
        backgroundColor: colour.color1,
      appBar: AppBar(
        title: Text("Todo", style: TextStyle(color: Colors.white),),
        backgroundColor: colour.color2,
        elevation: 2,
        centerTitle: true,),
      floatingActionButton: FloatingActionButton(onPressed: (){
        createtask();
      },child: Icon(Icons.add),backgroundColor: colour.color4,),
      body: ListView.builder(itemCount: db.list.length,itemBuilder: (context,index){
        return todotile(onChanged: (p0){
          onclick(index);
        }, taskcompleted:db.list[index][1], taskname: db.list[index][0],
          deletefunction: (context ) { deletetask(index);  },
        );
      })
    );
  }

  void createtask() {
    showDialog(context: context, builder: (context){
      return mydialog(onsave: () {
        savethedata();
        Navigator.pop(context);
        _controller.clear();
      }, controller: _controller,);
    });
  }

  void savethedata() {
    setState(() {
     db.list.add([_controller.text,false]);
    }
    );
    db.updatedata();
  }

  void deletetask(index) {
    setState(() {
      db.list.removeAt(index);
    });db.updatedata();

  }


}
