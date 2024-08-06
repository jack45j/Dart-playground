enum Currency {
  usd,
  twd,
  unknown;

  factory Currency.from(String unit) {
    switch (unit.toUpperCase()) {
      case "USD":
        return Currency.usd;
      case "TWD":
        return Currency.twd;
      default:
        return Currency.unknown;
    }
  }
}