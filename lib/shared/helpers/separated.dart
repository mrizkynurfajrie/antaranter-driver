String separated(value) {
  String first = value.toString().substring(0, 4);
  String second = value.toString().substring(4, 8);
  String third = value.toString().substring(8, 12);
  String forth = value.toString().substring(12, 16);
  return "$first $second $third $forth";
}
