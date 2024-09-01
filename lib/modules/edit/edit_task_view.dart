import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/firebase_utils.dart';
import 'package:to_do/core/page_route_names.dart';
import 'package:to_do/core/utils.dart';
import 'package:to_do/model/task_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/settings_provider.dart';

class EditTaskView extends StatefulWidget{
  const EditTaskView ({super.key});

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  //TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    TaskModel taskModel = ModalRoute.of(context)!.settings.arguments as  TaskModel;

    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: theme.primaryColor,
          title: Text(
            lang!.todoList,
            style: theme.textTheme.titleLarge?.copyWith(
              color:provider.isDark()?Colors.black:Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        centerTitle: false,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 100,horizontal: 50),
        padding: const EdgeInsets.all(10),
       width: double.infinity,
        decoration: BoxDecoration(
          color: provider.isDark() ? const Color(0xff141922) : Colors.white,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lang.editTask,
              style: theme.textTheme.titleLarge?.copyWith(
                color:provider.isDark()?Colors.white:Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),

          const Spacer(),
            TextFormField(
              initialValue: taskModel.title,
              onChanged: (value){
                taskModel.title = value;
              },
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: provider.isDark()?Colors.white :Colors.grey
                  )
                ),
                hintText: "This is title",
                  hintStyle: TextStyle(
                    color: provider.isDark()? Colors.white:Colors.black,
                  )
              ),

            ),

            const Spacer(),

            TextFormField(
              initialValue: taskModel.description,
              onChanged: (value){
                taskModel.description = value;
              },
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                         color: provider.isDark()?Colors.white :Colors.grey
                      )
                  ),
                  hintText: "Task details",
                  hintStyle: TextStyle(
                    color: provider.isDark()? Colors.white:Colors.black,
                  )
              ),

            ),

            const Spacer(),
            Text(
              lang.selectTime,
              style: theme.textTheme.titleLarge?.copyWith(
                color:provider.isDark()?Colors.white:const Color(0xff383838),
                fontSize: 20,
                fontWeight: FontWeight.normal,

              ),
            ),

            const SizedBox(height: 10),

            GestureDetector(
              onTap: (){
                showDatePicker(
                    context: context,
                    initialDate: extractDate(taskModel.selectedDate),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365))).then((value){
                            taskModel.selectedDate= extractDate(value!);
                            setState(() {

                            });
                }
                );
              },
              child: Text(
               extractDate(taskModel.selectedDate).toString().substring(0,10),
                style: theme.textTheme.titleLarge?.copyWith(
                  color:provider.isDark()?Colors.white:const Color(0xff383838),
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
              ),),
            ),

            const Spacer(),

          FilledButton(
              onPressed: (){
                EasyLoading.show();
                FirebaseUtils.updateTask(taskModel).then((value) => EasyLoading.dismiss());
                Navigator.pushReplacementNamed(context, PageRouteNames.layout);
                
              },
              child: Text(
               lang.saveChanges
              )
          ),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}