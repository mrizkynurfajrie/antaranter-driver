import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Api1 {
  String baseUrl = '/intake';
  Future<dynamic> apiJSONGet(
    String url,
  ) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers = ' + headers.toString());
    log('url = $baseUrl' + url);

    http.Response r = await http.get(Uri.parse('$url/'), headers: {
      'content-Type': 'application/json',
    });
    log("status codenya " + r.statusCode.toString());

    log(r.body);
    var data = json.decode(r.body);
    log(data);
    return data;
  }

  Future<dynamic> apiJSONPost(String url, Map<String, dynamic> params) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers = ' + headers.toString());
    log('url = $baseUrl' + url);

    var r = await http.post(Uri.parse('$url/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(params),
        encoding: Encoding.getByName("utf-8"));
    var data = jsonDecode(r.body);
    log("status codenya " + r.statusCode.toString());

    log(data);
    return data;
  }
}
