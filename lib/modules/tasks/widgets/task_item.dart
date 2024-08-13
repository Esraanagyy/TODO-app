import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget{
  const TaskItem({super.key});

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
          vertical: 30
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
                "Play BasketBall",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(
                  Icons.alarm,
                  size: 16,
                  color: Colors.black),
                const SizedBox(width: 5),
                Text(
                  "10:30 AM",
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