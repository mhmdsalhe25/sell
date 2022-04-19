class User {
  int? id;
  String name;
  int pieces;

  User({required this.name, this.id, required this.pieces});

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      name: data['name'],
      id: data['id'],
      pieces: data['pieces'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'pieces': pieces,
      };
}
