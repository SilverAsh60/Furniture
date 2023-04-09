class Banner1 {
  final String id;
  final String dateStart;
  final String dateEnd;
  final String imgURL;
  final String status;

  Banner1({
    required this.id,
    required this.dateEnd,
    required this.dateStart,
    required this.imgURL,
    required this.status,
  });

  factory Banner1.fromMap(Map data) {
    return Banner1(
      id: data['id'],
      dateEnd: data['dateEnd'],
      dateStart: data['dateStart'],
      imgURL: data['imgURL'],
      status: data['status'],
    );
  }
}
