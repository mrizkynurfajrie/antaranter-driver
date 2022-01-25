import 'dart:convert';

int getIntType({required dynamic value}) {
  if (value == null ||
      value == '' ||
      value == 0 ||
      value == '0' ||
      value == 'NULL' ||
      value == 'null') {
    return 0;
  } else {
    var valInt = int.tryParse(value.toString());
    if (valInt != null) {
      return valInt;
    } else {
      throw ('Value tidak sesuai');
    }
  }
}

bool getBoolType({required dynamic value}) {
  if (value == 1 || value == '1' || value == true || value == "true") {
    return true;
  } else {
    return false;
  }
}

String getStringType({required dynamic value}) {
  if (value == null) {
    return "";
  } else {
    var valString = value.toString();
    return valString;
  }
}

getDoubleType({required dynamic value}) {
  if (value != null) {
    double d = double.parse(value.toString());
    return d;
  } else {
    throw ('Value tidak sesuai');
  }
}

getIntTypeNew(dynamic value) {
  if (value != null) {
    var d = value.toInt();
    return d;
  } else {
    throw ('Value tidak sesuai');
  }
}

List<String> dataQr({required String data}) {
  return utf8.decode(base64.decode(data)).substring(6).split('|');
}

bool isValidQr({required String data}) {
  try {
    String d = utf8.decode(base64.decode(data));
    return d.contains("QROPT") || d.contains("QRCPT");
  } catch (e) {
    return false;
  }
}

bool isOpenQr({required String data}) {
  String d = utf8.decode(base64.decode(data));
  return d.contains("QROPT");
}
