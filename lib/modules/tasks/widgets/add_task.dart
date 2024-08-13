import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget{
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
       return Container(
         height: 400,
         padding: const EdgeInsets.only(
           left: 20,
           right: 20,
           top: 30,
           bottom: 20
         ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Text(
               "Add new Task",
               textAlign: TextAlign.center,
               style: theme.textTheme.bodyLarge?.copyWith(
                 color: Colors.black,
               ),
             ),
             const SizedBox(height: 30),
             TextFormField(
               controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Enter Task Title"
                ),
               validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return "please enter task title";
                  }
                  return null;
               },
             ),
             const SizedBox(height: 20),
               TextFormField(
                 controller: descriptionController,
                 maxLength: 3,
                 decoration: const InputDecoration(
                     hintText: "Enter Task Description "
                 ),
                 validator: (value){
                   if(value == null || value.trim().isEmpty){
                     return "please enter task description";
                   }
                   return null;
                 },
             ),
             const SizedBox(height: 20),
              Text(
               "Select time",
               style: theme.textTheme.bodyLarge?.copyWith(
                 color: Colors.black,
                 fontWeight: FontWeight.w500,
               ),
             ),
             const SizedBox(height: 10),
             InkWell(
               onTap: (){
                 getSelectedDate();
               },
               child: Text(
                 DateFormat("dd MMM yyyy").format(selectedDate),
                 //selectedDate.toString(),
                 textAlign: TextAlign.center,
                 style: theme.textTheme.bodyLarge?.copyWith(
                   color: Colors.black,
                   fontWeight: FontWeight.w500,
                 ),
               ),
             ),
             const Spacer(),
             FilledButton(
                 onPressed: (){},
               style: FilledButton.styleFrom(
                 backgroundColor: theme.primaryColor,
                 shape: RoundedRectangleBorder(
                     borderRadius:
                     BorderRadius.circular(8)
                 ),
               ),
                 child: Text(
                   "save ",
                   style: theme.textTheme.bodyMedium?.copyWith(
                     color: Colors.white,
                   ),
                 ),
             )
           ],
         ),

       )
  ;}
  getSelectedDate() async {
    var currentDate = await
    showDatePicker(
        context: context,
        firstDate:DateTime.now() ,
        lastDate: DateTime.now().add(const Duration(days: 365)),
        initialDate: DateTime.now());

       if(currentDate != null ){
         setState(() {
           selectedDate = currentDate;
         });
       }
  }

}