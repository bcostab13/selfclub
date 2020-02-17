import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String firstName;
  final int assistance;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['firstName'] != null),
        assert(map['assistance'] != null),
        firstName = map['firstName'],
        assistance = map['assistance'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$firstName:$assistance>";
}
