import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  static var database = FirebaseFirestore.instance;
  static var databaseCollectionOne = FirebaseFirestore.instance.collection('CounterOne');
  static var databaseCollectionTwo = FirebaseFirestore.instance.collection('CounterTwo');
  static var databaseCollectionThree = FirebaseFirestore.instance.collection('CounterThree');
  static int updatedValue = 0;
  static Future<void> updateCounter1(int updatedValue) {
    // Call the user's CollectionReference to add a new user
    return databaseCollectionOne.doc("counter1").update({'counter1': updatedValue})
    /* users
          .add({
        'counter1': counterModel.count.toString(), // John Doe
        // 42
      })*/
        .then((value) => print("Counter1 Updated"))
        .catchError((error) => print("Failed to add Counter1: $error"));
  }
  static Future<void> updateCounter2(int updatedValue) {
    // Call the user's CollectionReference to add a new user
    return databaseCollectionTwo.doc("counter2").update({'counter2': updatedValue})
    /* users
          .add({
        'counter1': counterModel.count.toString(), // John Doe
        // 42
      })*/
        .then((value) => print("Counter2 Updated"))
        .catchError((error) => print("Failed to add Counter2: $error"));
  }
  static Future<void> updateCounter3(int updatedValue) {
    // Call the user's CollectionReference to add a new user
    return databaseCollectionThree.doc("Counter3").update({'counter3': updatedValue})
    /* users
          .add({
        'counter1': counterModel.count.toString(), // John Doe
        // 42
      })*/
        .then((value) => print("Counter3 Updated"))
        .catchError((error) => print("Failed to add Counter3: $error"));
  }

  static refreshAllCounter(int updatedValue) {
    print("value refreshed");
    // Call the user's CollectionReference to add a new user
    updateCounter1(0);
    updateCounter2(0);
    updateCounter3(0);

  }

  static void getData() async
  {
    DocumentSnapshot? documentSnapshot;

    await databaseCollectionOne.doc("counter1").get().then((value)
    {
    documentSnapshot = value;
    });
    updatedValue = documentSnapshot?['counter1'];
    print("counter value is $updatedValue");
  }
}