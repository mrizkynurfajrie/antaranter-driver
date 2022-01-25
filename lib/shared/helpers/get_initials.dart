String getInitials({required String text, int? limitTo}) {
  StringBuffer buffer = StringBuffer();
  List<String> split = text.split(' ');
  for (var i = 0; i < (limitTo ?? split.length); i++) {
    buffer.write(split[i][0]);
  }
  final String initial = buffer.toString();
  final String finalInitial =
      initial.length > 1 ? initial.substring(0, 2) : initial;
      
  return finalInitial.toUpperCase();
}
