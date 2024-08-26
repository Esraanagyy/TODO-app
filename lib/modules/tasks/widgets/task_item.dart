import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/model/task_model.dart';

class TaskItem extends StatefulWidget{

  final TaskModel taskModel;
  const TaskItem({super.key, required this.taskModel});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child:  ListTile(
        leading:Container(
          width: 6,
          height: 190,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
        ) ,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
                widget.taskModel.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            const SizedBox(height: 6),
            Text(
              widget.taskModel.description,
              style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.alarm,
                  size: 16,
                  color: Colors.black),
                const SizedBox(width: 5),
                Text(
                  DateFormat("dd MMM yyyy").format(widget.taskModel.selectedDate),
                  style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

          ],
        ) ,
        trailing:Container(
          width:70 ,
          height: 35,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 25,
          ),

        ),
      ),
    )
 ; }
}