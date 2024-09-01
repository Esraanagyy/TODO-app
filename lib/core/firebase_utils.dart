import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:to_do/core/utils.dart';
import 'package:to_do/model/task_model.dart';
import 'package:to_do/services/snack_bar_service.dart';

class FirebaseUtils{


  static CollectionReference <TaskModel> getCollectionRef()
  {
    return FirebaseFirestore.instance
        .collection(TaskModel.collectionName)
        .withConverter<TaskModel>(
        fromFirestore:(snapshot , _) =>TaskModel.fromFirestore(snapshot.data()!),
        toFirestore: (taskModel , _) =>taskModel.toFirestore(),
    );

  }

  static Future<void> addTaskToFirestore(TaskModel taskModel)
  async {
          var collectionRef =  getCollectionRef();
          var docRef = collectionRef.doc(); //create doc with auto id

          taskModel.id =  docRef.id;

          return docRef.set(taskModel);

  }

  static Future<List<TaskModel>> readOnetimeFromFirestore(
      DateTime selectedDate) async {
    var collectionRef = getCollectionRef()
        .where(
      "selectedDate",
      isEqualTo: extractDate(selectedDate).millisecondsSinceEpoch,
    );
    var data = await collectionRef.get();
    var tasksList = data.docs.map((e) => e.data()).toList();
    return tasksList;
  }

  static Stream<QuerySnapshot<TaskModel>> getRealTimeData(
      DateTime selectedDate) {
    var collectionRef = getCollectionRef()
        .where(
      "selectedDate",
      isEqualTo: extractDate(selectedDate).millisecondsSinceEpoch,
    );
    return collectionRef.snapshots();
  }

  static Future<void> deleteTask (TaskModel taskModel)async {

    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc(taskModel.id);
    return docRef.delete();

  }

  static Future<void> updateTask(TaskModel taskModel)
  async {

    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc(taskModel.id);

    return docRef.update(
        taskModel.toFirestore()
    );

  }

  static Future<void> taskIsDone(TaskModel taskModel)
  async {

    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc(taskModel.id);

    taskModel.isDone = true;

    return docRef.update(
        taskModel.toFirestore()
    );

  }

  static Future<bool> createAccount(String emailAddress, String password) async{
    try {
      EasyLoading.show();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Future.value(true);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.dismiss();
        SnackBarService.showErrorMessage("The password provided is too weak.");
        return Future.value(false);

      } else if (e.code == 'email-already-in-use') {
        EasyLoading.dismiss();
        SnackBarService.showErrorMessage("The account already exists for that email.");
        return Future.value(false);
      }
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
      return Future.value(false);

    }
    return Future.value(false);

  }

  static Future<bool> signIn(String emailAddress, String password) async {

    try {
      EasyLoading.show();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.dismiss();
        SnackBarService.showErrorMessage("No user found for that email.");
        return Future.value(false);

      } else if (e.code == 'wrong-password') {
        EasyLoading.dismiss();
        SnackBarService.showErrorMessage("Wrong password provided for that user.");
        return Future.value(false);

      }
    }
    return Future.value(false);

  }


}