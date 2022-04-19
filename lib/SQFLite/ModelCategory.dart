class Category {
  int? id;
  String category;
  int price;
  int number;

  Category(
      { this.id,
      required this.category,
      required this.price,
      required this.number});

  factory Category.fromMap(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      category: data['category'],
      price: data['price'], number: data['number'],
    );
  }
  Map<String,dynamic>toMap()=>{
    'id':id,
  'category': category,
  'price':price,
  'number':number,
  };

}
