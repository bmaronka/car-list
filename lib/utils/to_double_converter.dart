double? convertToDouble(dynamic number) {
  if (number is num) {
    return number.toDouble();
  } else if (number is String) {
    return double.tryParse(number) ?? 0;
  }

  return null;
}
