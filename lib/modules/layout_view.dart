import 'package:flutter/material.dart';
import 'package:to_do/core/page_route_names.dart';
import 'package:to_do/modules/settings/settings_view.dart';
import 'package:to_do/modules/tasks/tasks_view.dart';
import 'package:to_do/modules/tasks/widgets/add_task.dart';

class LayoutView extends StatefulWidget{
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screenList =[
      const TasksView(),
      const SettingsView(),
  ];

  get provider => null;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: screenList[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context)=> const AddTask());
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: theme.primaryColor,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        notchMargin: 12,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value){
               setState(() {
                 currentIndex = value;
               });
          },
          items: const [
               BottomNavigationBarItem(icon: ImageIcon(
                 AssetImage("assets/icons/icon_list.png"),
               ),
                 label: "Tasks",

               ),

            BottomNavigationBarItem(icon: ImageIcon(
              AssetImage("assets/icons/icon_settings.png"),
            ),
              label: "Settings"
            ),
  ]),
      ),
    )

  ;}
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}