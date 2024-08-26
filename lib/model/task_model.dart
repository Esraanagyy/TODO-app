

import 'package:to_do/core/utils.dart';

class TaskModel{

  static const String collectionName ="TasksCollections";

  String? id;
  String title = " ";
  String description = " ";
  DateTime selectedDate = DateTime.now();
  bool isDone = false;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.selectedDate,
     this.isDone = false,
});

  TaskModel.init();
  TaskModel.set(TaskModel taskModel){
    id = taskModel.id;
    title = taskModel.title;
    description = taskModel.description;
    selectedDate = taskModel.selectedDate;
    isDone = taskModel.isDone;
  }

  factory TaskModel.fromFirestore(Map<String , dynamic> json) =>
     TaskModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      selectedDate: DateTime.fromMillisecondsSinceEpoch(json["selectedDate"]),
      isDone: json["isDone"],);

   Map<String , dynamic> toFirestore(){
    return{
    "id" : id,
    "title" : title,
    "description" : description,
    "selectedDate" : selectedDate.millisecondsSinceEpoch,
    "isDone" : isDone,
  };
}
// extractDate(selectedDate).millisecondsSinceEpoch

}