class ProductModel {
  final int id;
  final String title;
  final price;
  final String description;
  final String category;
  final String image;
  dynamic Amount = 1;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      title: data['title'],
      price: data['price'],
      description: data['description'],
      category: data['category'], // Assuming there's a Category.fromJson method
      image: data['image'],

      // Assuming there's a Rating.fromJson method
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'image': image,
      'price': price,
      'Amount': Amount,
    };
  }
}

// Assuming there are Category and Rating classes with their own fromJson methods
