class Category {
  final String img;
  final String name;
  final String id;
  final String status;

  Category(
      {required this.img,
      required this.name,
      required this.id,
      required this.status});

  /*
  Category.fromJson(Map<String, Object?> json)
      : this(
    id: json['id']! as String,
    img: json['img']! as String,
    name: json['name']! as String,
    status: json['status']! as String,
  );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'img': img,
      'name':name,
      'status':status,
    };
  }

  factory Category.fromMap(Map data) {
    return Category(
      id: data['id'],
      img: data['img'],
      name: data['name'],
      status: data['status'],
    );
  }*/
}
