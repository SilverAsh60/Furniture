class Product {
  final String name;
  final String img;
  final String id;
  final List<String> color;
  final List<String> size;
  final double rootPrice;
  final double currentPrice;
  final String status;

  Product({
    required this.name,
    required this.img,
    required this.id,
    required this.color,
    required this.size,
    required this.rootPrice,
    required this.currentPrice,
    required this.status,
  });
}
