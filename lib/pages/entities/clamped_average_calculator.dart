class ClampedAverageCalculator {
  static double calculate(List<int> ratings) {
    if (ratings.isEmpty) return 0;
    int totalRatings = ratings.length;
    int sumRatings = ratings.reduce((value, element) => value + element);
    double average = sumRatings / totalRatings;

    // Clamp the average to the range [1, 5]
    double clampedAverage = average.clamp(1.0, 5.0);

    return clampedAverage;
  }
}
