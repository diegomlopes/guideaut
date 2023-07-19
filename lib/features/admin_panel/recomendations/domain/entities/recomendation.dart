class Recomendation {
  Recomendation({
    required this.title,
    required this.category,
    required this.description,
    required this.userId,
  });

  final String title;
  final String category;
  final String description;
  final String userId;

  static Recomendation fromJson(Map json) {
    return Recomendation(
        title: json["title"],
        category: json["category"],
        description: json["description"],
        userId: json["userId"]);
  }

  @override
  String toString() {
    return "Recomendation => title: $title | category: $category | description: $description | userId: $userId";
  }
}
