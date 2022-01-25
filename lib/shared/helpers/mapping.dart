// ignore_for_file: unnecessary_null_comparison

List<T> mapping<T>(List list, Function handler) {
  List<T> result = [];

  if (list != null) {
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
  }

  return result;
}
