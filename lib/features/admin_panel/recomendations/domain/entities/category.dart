class Category {
  Category({
    required this.value,
    required this.text,
  });

  final String value;
  final String text;

  static Category fromJson(Map json) {
    return Category(
      value: json["value"],
      text: json["text"],
    );
  }

  @override
  String toString() {
    return "Category => value: $value | text: $text";
  }
}
