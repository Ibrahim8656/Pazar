class CartResponse {
  final bool status;
  final String? message;
  final CartData data;

  CartResponse({required this.status, this.message, required this.data});

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        status: json['status'],
        message: json['message'],
        data: CartData.fromJson(json['data']),
      );
}

class CartData {
  final List<CartItem> cartItems;
  final double subTotal;
  final double total;

  CartData({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        cartItems: List<CartItem>.from(json['cart_items'].map((x) => CartItem.fromJson(x))),
        subTotal: json['sub_total'].toDouble(),
        total: json['total'].toDouble(),
      );
}

class CartItem {
  final int id;
  final int quantity;
  final Product product;

  CartItem({required this.id, required this.quantity, required this.product});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['id'],
        quantity: json['quantity'],
        product: Product.fromJson(json['product']),
      );
}

class Product {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        price: json['price'].toDouble(),
        oldPrice: json['old_price'].toDouble(),
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description'],
        images: List<String>.from(json['images']),
        inFavorites: json['in_favorites'],
        inCart: json['in_cart'],
      );
}
