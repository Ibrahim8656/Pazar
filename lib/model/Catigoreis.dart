class CategoryModel {
  bool status;
  String? message;
  CategoryData data;

  CategoryModel({required this.status, this.message, required this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      status: json['status'],
      message: json['message'],
      data: CategoryData.fromJson(json['data']),
    );
  }
}

class CategoryData {
  int currentPage;
  List<Category> categories;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String path;
  int perPage;
  int? to;
  int total;

  CategoryData({
    required this.currentPage,
    required this.categories,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Category> categoryList =
        list.map((i) => Category.fromJson(i)).toList();

    return CategoryData(
      currentPage: json['current_page'],
      categories: categoryList,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class Category {
  int id;
  String name;
  String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
