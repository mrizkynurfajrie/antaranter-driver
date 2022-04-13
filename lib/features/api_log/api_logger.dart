import 'dart:convert';

import 'package:antaranter_driverapp/framework/api2.dart';

class ModelApiLog {
  final String url;
  final String payload;
  final String response;
  final String method;
  final DateTime timestamp;
  final String error;
  ModelApiLog({
    required this.url,
    required this.payload,
    this.response = '',
    required this.method,
    DateTime? timestamp,
    this.error = '',
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'payload': payload,
      'response': response,
      'method': method,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'error': error,
    };
  }

  factory ModelApiLog.fromMap(Map<String, dynamic> map) {
    return ModelApiLog(
      url: map['url'],
      payload: map['payload'],
      response: map['response'],
      method: map['method'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelApiLog.fromJson(String source) =>
      ModelApiLog.fromMap(json.decode(source));
}

class ApiLogger {
  Future log({required ModelApiLog data}) async {
    List<ModelApiLog> currentLog = await apiLogs();
    List<ModelApiLog> newDataLog = currentLog.isEmpty || currentLog.length <= 20
        ? currentLog
        : currentLog.sublist(1);
    newDataLog.add(data);
    await Api2().setApiLogger(value: jsonEncode(newDataLog));
  }

  Future<List<ModelApiLog>> apiLogs() async {
    var dataLog = await Api2().getApiLogger() ?? '';
    List data = (dataLog).isNotEmpty ? jsonDecode(dataLog) : [];
    return List.from(data.map((e) => ModelApiLog.fromJson(e)));
  }
}
