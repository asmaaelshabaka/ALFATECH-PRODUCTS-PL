class CartProductModel {
  String? name, image, price, productId;
  int? quantity;
  CartProductModel(
      this.name, this.image, this.price, this.quantity, this.productId);
  CartProductModel.formJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map['id'];
  }
  toJson() {
    return {'name': name, 'image': image, 'quantity': quantity, 'price': price,'id':productId};
  }
}
