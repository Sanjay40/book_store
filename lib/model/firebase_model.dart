class Product {
  bool? like;
  bool? cart;

  Product({
    required this.like,
    required this.cart,
  });

  Product.fromMap(Map<String,dynamic> map){
    like = map['like'];
    cart = map['cart'];
  }


  Map<String,dynamic> toMap() => {
    'like' : like,
    'cart' : cart,

  };


}