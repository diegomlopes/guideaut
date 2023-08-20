class CategoryEntity {
  CategoryEntity({
    required this.value,
    required this.text,
  });

  final String value;
  final String text;

  static CategoryEntity fromJson(Map json) {
    return CategoryEntity(
      value: json["value"],
      text: json["text"],
    );
  }

  @override
  String toString() {
    return "Category => value: $value | text: $text";
  }
}
