class FoodModel {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  FoodModel({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
  });

  factory FoodModel.fromJson(dynamic json) {
    return FoodModel(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
    );
  }

  static List<FoodModel> foodsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return FoodModel.fromJson(data);
    }).toList();
  }
}
