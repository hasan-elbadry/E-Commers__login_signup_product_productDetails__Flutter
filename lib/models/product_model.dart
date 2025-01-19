class ProductModel {
  num price;
  String image;
  String name;
  String description;

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.price});

  static List<ProductModel> fetch(dynamic data) {
    List<ProductModel> products = [];
    for (var product in data['data']['products']) {
      products.add(ProductModel(
          name: product['name'],
          image: product['image'],
          description: product['description'],
          price: product['price']));
    }

    return products;
  }
}
