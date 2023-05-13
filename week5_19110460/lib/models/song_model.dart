import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Song with ChangeNotifier {
  final String name;
  final String sing;
  final String img;
  final String liker;
  final String year;

  final DocumentReference reference;

  Song.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
          snapshot.data() as Map<dynamic, dynamic>,
          reference: snapshot.reference,
        );

  Song.fromMap(
    Map<dynamic, dynamic> map, {
    required this.reference,
  })  : assert(map['name'] != null),
        assert(map['sing'] != null),
        assert(map['liker'] != null),
        assert(map['img'] != null),
        assert(map['year'] != null),
        name = map['name'],
        sing = map['sing'],
        liker = map['liker'],
        img = map['img'],
        year = map['year'];

  @override
  String toString() => "Song<$name:$sing>";
}
