class ProductResponse {
  final bool status;
  final String? message;
  final ProductData data;

  ProductResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'] ?? null,
      message: json['message'],
      data: ProductData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ProductData {
  final List<BannerModel> banners;
  final List<ProductModel> products;
  final String ad;

  ProductData({
    required this.banners,
    required this.products,
    required this.ad,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      banners: (json['banners'] as List)
          .map((bannerJson) => BannerModel.fromJson(bannerJson))
          .toList(),
      products: (json['products'] as List)
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList(),
      ad: json['ad'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banners': banners.map((banner) => banner.toJson()).toList(),
      'products': products.map((product) => product.toJson()).toList(),
      'ad': ad,
    };
  }
}

class BannerModel {
  final int id;
  final String image;
  final dynamic category;
  final dynamic product;

  BannerModel({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
      category: json['category'],
      product: json['product'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'category': category,
      'product': product,
    };
  }
}

class ProductModel {
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

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'old_price': oldPrice,
      'discount': discount,
      'image': image,
      'name': name,
      'description': description,
      'images': images,
      'in_favorites': inFavorites,
      'in_cart': inCart,
    };
  }
}
