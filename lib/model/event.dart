import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String name;
  final DocumentReference reference;

  Event.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        name = map['name'];

  Event.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Event<$name>";
}
