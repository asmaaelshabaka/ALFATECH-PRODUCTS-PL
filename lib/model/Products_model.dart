class ProductsModel {
  String? productId,name, image, description, mainBrand, price;
  ProductsModel(
      this.name, this.image, this.description, this.mainBrand, this.price,this.productId);
  ProductsModel.formJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    mainBrand = map['mainbrand'];
    price = map['price'];
    productId=map['id'];
  }
  toJson() {
    return {
      'name': name,
      'image':image,
      'description':description,
      'mainbrand':mainBrand,
      'price':price,
      'id':productId

    };
  }
}
