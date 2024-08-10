class Percentage {
  final double value;

  Percentage(this.value) {
    if (value < 0 || value > 100) {
      throw ArgumentError('Percentage must be between 0 and 100');
    }
  }

  double applyTo(double amount) => amount * (value / 100);
}