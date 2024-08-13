import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
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
                              child: EasyInfiniteDateTimeLine(
                                controller: _controller,
                                firstDate: DateTime(2024),
                                focusDate: _focusDate,
                                lastDate: DateTime.now().
                                add(const Duration(days: 365)),
                                onDateChange: (selectedDate) {
                                  setState(() {
                                    _focusDate = selectedDate;
                                  });
                                },
                                showTimelineHeader: false,
                                timeLineProps:  const EasyTimeLineProps(
                                  separatorPadding:10,
                                ),
                                dayProps: EasyDayProps(
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
                                      )
                                  ),

                              ),
                            ),
                          ),
                          ),
                        ]
                      ),
                  ),
                Expanded(
                  child: ListView.builder(
                      itemBuilder :(context , index) => const TaskItem() ,
                    itemCount: 3,
                  ),
                )


          ],
        )
  ;}
}