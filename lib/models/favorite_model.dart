class Favorite {
  final String idProduct;
  final String nameProduct;
  final String imgProduct;
  final int? idFavorite;
  final double price;

  Favorite({
    this.idFavorite,
    required this.imgProduct,
    required this.nameProduct,
    required this.idProduct,
    required this.price,
  });

  Favorite.fromMap(Map<String, dynamic> cart)
      : idFavorite = cart["idFavorite"],

        idProduct = cart["idProduct"],

        nameProduct = cart["nameProduct"],
        imgProduct = cart["imgProduct"],
        price = cart["price"];

  Map<String, Object?> toMap() {
    return {'idFavorite':idFavorite,'idProduct': idProduct, 'nameProduct':nameProduct , 'imgProduct':imgProduct, 'price': price};
  }

}
