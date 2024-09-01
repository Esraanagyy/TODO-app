import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/page_route_names.dart';
import 'package:to_do/model/task_model.dart';

import '../../../core/firebase_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/settings_provider.dart';

class TaskItem extends StatelessWidget{

  final TaskModel taskModel;
  const TaskItem({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    child: Slidable(
    //key: const ValueKey(0),
    startActionPane: ActionPane(
    motion:  const BehindMotion(),
    extentRatio: 0.5,

    children:  [
    SlidableAction(
      padding: EdgeInsets.zero,
    onPressed: (context){
        EasyLoading.show();
        FirebaseUtils.deleteTask(taskModel).then((value) => EasyLoading.dismiss());
        },
    borderRadius:const BorderRadius.only(
          topLeft: Radius.circular(15),
            bottomLeft:  Radius.circular(15),
       ) ,
      backgroundColor: const Color(0xFFFE4A49),
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: lang?.delete,
        ),

      SlidableAction(
        padding: EdgeInsets.zero,
        onPressed: (context){
          Navigator.pushNamed(context, PageRouteNames.edit ,arguments: taskModel);
        },
        backgroundColor: const Color(0xFF21B7CA),
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: lang?.edit,
      ),

    ],
    ),

        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15
          ),
          decoration: BoxDecoration(
            color: provider.isDark() ? const Color(0xff141922) : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child:  ListTile(
            leading:Container(
              width: 6,
              height: 170,
              decoration: BoxDecoration(
                color: taskModel.isDone ? const Color(0xff61E757) :theme.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ) ,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    taskModel.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                        color: taskModel.isDone ? const Color(0xff61E757) :theme.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                const SizedBox(height: 6),
                Text(
                  taskModel.description,
                  style: theme.textTheme.titleLarge?.copyWith(
                      color: taskModel.isDone ?
                      const Color(0xff61E757) :provider.isDark()?Colors.white :Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Row(
                  children: [
                     Icon(
                      Icons.alarm,
                      size: 16,
                      color: provider.isDark()?Colors.white:Colors.black
                    ),
                    const SizedBox(width: 5),
                    Text(
                      DateFormat("dd MMM yyyy").format(taskModel.selectedDate),
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: provider.isDark()?Colors.white:Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

              ],
            ) ,
            trailing: taskModel.isDone ?
            Text(
              lang!.done,
              style: theme.textTheme.titleLarge?.copyWith(
                  color: const Color(0xff61E757),
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            )

                :InkWell(
              onTap: (){
                EasyLoading.show();
                FirebaseUtils.taskIsDone(taskModel).then((value) => EasyLoading.dismiss());
              },
                  child: Container(
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
          ),
        ),
    )
    ); }
}