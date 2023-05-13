import 'package:cloud_firestore/cloud_firestore.dart';

class Singer {
  final String name;
  final String avatar;
  final DocumentReference reference;

  Singer.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
          snapshot.data() as Map<dynamic, dynamic>,
          reference: snapshot.reference,
        );

  Singer.fromMap(
    Map<dynamic, dynamic> map, {
    required this.reference,
  })  : assert(map['name'] != null),
        assert(map['avatar'] != null),
        name = map['name'],
        avatar = map['avatar'];

  @override
  String toString() => "Singer<$name:$avatar>";
}
