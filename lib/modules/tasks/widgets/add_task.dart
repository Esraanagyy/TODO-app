import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/firebase_utils.dart';
import 'package:to_do/model/task_model.dart';
import 'package:to_do/services/snack_bar_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/settings_provider.dart';

class AddTask extends StatefulWidget{
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context);
    var provider = Provider.of<SettingsProvider>(context);

       return Container(
         //height: 400,
         padding: const EdgeInsets.only(
           left: 20,
           right: 20,
           top: 30,
           bottom: 20
         ),
        decoration: BoxDecoration(
          color: provider.isDark() ? const Color(0xff141922):Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
         child: Form(
           key: formKey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Text(
                 lang!.addNewTask,
                 textAlign: TextAlign.center,
                 style: theme.textTheme.bodyLarge?.copyWith(
                   color: provider.isDark()? Colors.white:Colors.black,
                 ),
               ),
               const SizedBox(height: 30),
               TextFormField(
                 controller: titleController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: provider.isDark()?Colors.white :Colors.grey
                          )
                      ),
                    hintText: lang.enterTaskTitle,
                    hintStyle: TextStyle(
                      color: provider.isDark()? Colors.white:Colors.black,
                    )
                  ),
                 validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return lang.enterTaskTitle;
                    }
                    return null;
                 },
               ),
               const SizedBox(height: 20),
                 TextFormField(
                   controller: descriptionController,
                   maxLines: 2,
                   decoration: InputDecoration(
                       border: UnderlineInputBorder(
                           borderSide: BorderSide(
                               color: provider.isDark()?Colors.white :Colors.grey
                           )
                       ),
                       hintText: lang.enterTaskDescription,
                       hintStyle: TextStyle(
                         color: provider.isDark()? Colors.white:Colors.black,
                       )
                   ),
                   validator: (value){
                     if(value == null || value.trim().isEmpty){
                       return lang.enterTaskDescription;
                     }
                     return null;
                   },
               ),
               const SizedBox(height: 20),
                Text(
                 lang.selectTime,
                 style: theme.textTheme.bodyLarge?.copyWith(
                   color: provider.isDark()? Colors.white:Colors.black,
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
                     color: provider.isDark()? Colors.white:Colors.black,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
               ),
               const Spacer(),
               FilledButton(
                   onPressed: (){
                     if(formKey.currentState!.validate()){
                       var taskModel = TaskModel(
                         title: titleController.text,
                         description: descriptionController.text,
                         selectedDate: selectedDate,
                       );

                       print(taskModel.toFirestore());
                       EasyLoading.show();
                       FirebaseUtils.addTaskToFirestore(taskModel).then((value){
                         Navigator.pop(context);
                         EasyLoading.dismiss();
                         SnackBarService.showSuccessMessage(
                             " Task successfully added! "
                         );

                       });

                     }
                   },
                 style: FilledButton.styleFrom(
                   backgroundColor: theme.primaryColor,
                   shape: RoundedRectangleBorder(
                       borderRadius:
                       BorderRadius.circular(8)
                   ),
                 ),
                   child: Text(
                     lang.save,
                     style: theme.textTheme.bodyMedium?.copyWith(
                       color: Colors.white,
                     ),
                   ),
               )
             ],
           ),
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