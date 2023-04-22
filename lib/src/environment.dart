import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Language { es, en, fr }

abstract class Environment {
  static String get fileName =>
      kReleaseMode ? '.env.production' : '.env.development';
  static Network network = const Network._();
}

class Network {
  const Network._();

  final Map<String, String> headers = const {
    HttpHeaders.acceptHeader: '*/*',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  // Protocol get protocol => dotenv.env['PROTOCOL'] != null &&
  //         dotenv.env['PROTOCOL'].toString().toLowerCase() == 'http'
  //     ? Protocol.http
  //     : Protocol.https;
  String get apiUrl => dotenv.env['DEBUG'] != null
      ? dotenv.env['DEBUG'].toString().toLowerCase() == 'true'
          ? dotenv.env['API_URL'] ?? 'NOT FOUNT API_URL'
          : dotenv.env['API_URL_PRODUCTION'] ?? 'NOT FOUNT API_URL_PRODUCTION'
      : dotenv.env['API_URL'] ?? 'ERROR API_URL';
}
