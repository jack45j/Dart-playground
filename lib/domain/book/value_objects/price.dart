import 'package:dart_playground/domain/shared/value_objects/currency.dart';

class Price {
  double amount;
  Currency unit;

  Price(this.amount, this.unit);

  Price calculateDiscount(num discounted) {    
    return Price(
      (this.amount * discounted * 100).ceil() / 100,
      this.unit
    );
  }
}