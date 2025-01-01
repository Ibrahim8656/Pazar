class FavoritesModel {
  bool status;
  String? message;
  Data? data; // Data can be null now

  FavoritesModel({
    required this.status,
    this.message,
    this.data, // Make data nullable
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? Data.fromJson(json['data'])
          : null, // Handle null data
    );
  }
}

class Data {
  int currentPage;
  List<ProductDataa> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String? nextPageUrl;
  String path;
  int perPage;
  String? prevPageUrl;
  int to;
  int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List? ?? []; // Use an empty list if null
    List<ProductDataa> productList =
        dataList.map((i) => ProductDataa.fromJson(i)).toList();

    return Data(
      currentPage: json['current_page'] ??
          0, // Provide default values if any field is null
      data: productList,
      firstPageUrl: json['first_page_url'] ?? '',
      from: json['from'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      lastPageUrl: json['last_page_url'] ?? '',
      nextPageUrl: json['next_page_url'],
      path: json['path'] ?? '',
      perPage: json['per_page'] ?? 0,
      prevPageUrl: json['prev_page_url'],
      to: json['to'] ?? 0,
      total: json['total'] ?? 0,
    );
  }
}

class ProductDataa {
  int id;
  Product product;

  ProductDataa({
    required this.id,
    required this.product,
  });

  factory ProductDataa.fromJson(Map<String, dynamic> json) {
    return ProductDataa(
      id: json['id'] ?? 0, // Provide default values
      product: Product.fromJson(json['product'] ??
          {}), // Handle product being null by passing an empty map
    );
  }
}

class Product {
  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0, // Provide default values if fields are null
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      oldPrice: (json['old_price'] as num?)?.toDouble() ?? 0.0,
      discount: json['discount'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? 'Unknown Product',
      description: json['description'] ?? 'No description available',
    );
  }
}
