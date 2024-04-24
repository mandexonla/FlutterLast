import 'package:hive_flutter/adapters.dart';

class ToDoDatabase {
  List toDoList = [];
  final _myBox = Hive.box('myBox');

// chay cai nay neu day la lan dau tien mo app
  void createInintData() {
    toDoList = [
      ["Trộm chó", true],
      ["Ăn cức", false],
    ];
  }

// load data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }
// update database
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
