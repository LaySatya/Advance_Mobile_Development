class Pancake {
  final String id;
  final String color;
  final double price;

  Pancake({required this.id, required this.color, required this.price});
}

class PancakeDto {
  static Pancake fromJson(String id, Map<String, dynamic> json) =>
      Pancake(id: id, color: json['color'], price: json['price']);
}

