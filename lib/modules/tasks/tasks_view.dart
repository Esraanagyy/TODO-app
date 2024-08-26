import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core/firebase_utils.dart';
import 'package:to_do/model/task_model.dart';
import 'package:to_do/modules/tasks/widgets/task_item.dart';

class TasksView extends StatefulWidget{
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}


class _TasksViewState extends State<TasksView> {

  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();

  var _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);

    return  Column(
          children: [
                Padding(
                    padding: const EdgeInsets.only(
                      bottom: 40
                    ),
                    child: Stack(
                        clipBehavior: Clip.none,
                        alignment:Alignment.bottomCenter ,
                        children: [
                          Container(
                          padding: const EdgeInsets.only(
                            top: 50,
                              left:20,
                            right: 15,
                          ),
                          width:mediaQuery.size.width ,
                          height: mediaQuery.size.height*0.2,
                          color: theme.primaryColor,
                          child: Text(
                            "To Do List",
                            style: theme.textTheme.titleLarge?.copyWith(
                              color:Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                          Positioned(
                            top: 120,
                            child: SizedBox(
                              width: mediaQuery.size.width,
                              child:  EasyInfiniteDateTimeLine(
                                selectionMode: const SelectionMode.alwaysFirst(),
                                controller: _controller,
                                firstDate: DateTime(2024),
                                focusDate: _focusDate,
                                lastDate: DateTime.now().add(
                                  const Duration(days: 365),
                                ),
                                onDateChange: (selectedDate) {
                                  setState(() {
                                    _focusDate = selectedDate;
                                  });
                                },
                                showTimelineHeader: false,
                                timeLineProps:  const EasyTimeLineProps(
                                  backgroundColor: Colors.transparent,
                                  separatorPadding:10,
                                ),
                                dayProps: EasyDayProps(
                                   todayStyle: DayStyle(
                                     decoration: BoxDecoration(
                                       color: Colors.white.withOpacity(0.8),
                                       borderRadius: BorderRadius.circular(12),
                                     ),
                                     monthStrStyle: theme.textTheme.bodyMedium?.copyWith(
                                       fontWeight: FontWeight.bold,
                                       fontSize: 14,
                                       color: Colors.black,
                                     ),
                                     dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                                       fontWeight: FontWeight.bold,
                                       fontSize: 14,
                                       color: Colors.black,
                                     ),
                                     dayStrStyle: theme.textTheme.bodyMedium?.copyWith(
                                       fontWeight: FontWeight.bold,
                                       fontSize: 14,
                                       color: Colors.black,
                                     ),
                                   ),

                                  activeDayStyle: DayStyle(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    monthStrStyle: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                    ),
                                    dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                        fontSize: 14
                                  ),
                                    dayStrStyle: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    )
                                ),
                                  inactiveDayStyle: DayStyle(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      monthStrStyle: theme.textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black,
                                      ),
                                      dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black,
                                      ),
                                      dayStrStyle: theme.textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black,
                                      ),
                                  ),

                              ),
                            ),
                          ),
                          ),
                        ]
                      ),
                  ),

                Expanded(
              child: StreamBuilder<QuerySnapshot<TaskModel>>(
                stream: FirebaseUtils.getRealTimeData(_focusDate),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Expanded(
                      child: Center(
                        child: Text(
                         "something went wrong",
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                      ),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: theme.primaryColor,
                        ),
                      ),
                    );
                  }

                  var tasksList = snapshot.data?.docs
                      .map(
                        (e) => e.data(),
                  )
                      .toList();

                  return tasksList == null || tasksList.isEmpty
                      ? Expanded(
                    child: Center(
                      child: Text(
                        "No tasks for today",
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  )
                      : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => TaskItem(
                        taskModel: tasksList[index],
                      ),
                      itemCount: tasksList.length ?? 0,
                    ),
                  );
                },
              ), ),




          ],
        )
  ;}
}