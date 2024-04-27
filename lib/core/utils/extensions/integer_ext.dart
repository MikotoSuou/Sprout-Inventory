
import 'package:intl/intl.dart';

extension IntegerExt on int? {

  String get toStringAmount {
    final amount = this ?? 0;
    final formatter = NumberFormat.simpleCurrency(locale: "en_PH", name: "₱");
    return formatter.format(amount);
  }

  double lessDiscountPercentage(double percentage) {
    final amount = this ?? 0;
    final amountToDeduct = amount * (percentage / 100);
    final discountedPrice = amount - amountToDeduct;
    return discountedPrice;
  }

}