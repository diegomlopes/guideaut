class RatingEntity {
  RatingEntity({
    required this.rate,
    required this.userId,
  });

  final int rate;
  final String userId;

  @override
  String toString() {
    return ""
        'RATE: $rate, USER: $userId \n'
        "";
  }
}
