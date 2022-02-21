import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_agenda_boa/AppEnum/app_enums.dart';

class FirebaseServices {
  final CounterType _counterType;
  late final CollectionReference _collectionReference;
  late final DocumentReference _documentReference;

  FirebaseServices(this._counterType) {
    _collectionReference = FirebaseFirestore.instance.collection(_counterType.firebaseCollection);
    _documentReference = _collectionReference.doc(_counterType.firebaseDoc);
  }

  Future<int> updateCounter(int updatedValue) async {
    await _documentReference.update({_counterType.firebaseField(): updatedValue});
    return await getCounterValue();
  }

  Future<int> getCounterValue() async {
    var document = await _documentReference.get();
    return document[_counterType.firebaseField()];
  }
}

extension on CounterType {
  String get firebaseCollection => 'CounterCollection';

  String get firebaseDoc => 'counterDoc';

  String firebaseField() {
    switch (this) {
      case CounterType.counter1:
        return 'counter1';
      case CounterType.counter2:
        return 'counter2';
      case CounterType.counter3:
        return 'counter3';
    }
  }
}
