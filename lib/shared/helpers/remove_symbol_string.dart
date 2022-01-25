removeSymbolFromString(String txt) {
  return txt
      .replaceAll(RegExp(r'[^\w\s]+'), '')
      .replaceAll(RegExp(r"\s\b|\b\s"), "");
}
