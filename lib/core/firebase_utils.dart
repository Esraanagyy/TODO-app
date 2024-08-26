import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/core/utils.dart';
import 'package:to_do/model/task_model.dart';

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


}