import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:yandra_app/.env.dart';
import 'package:yandra_app/repositories/app_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  final String _baseUrl = Config.BASE_URL;
  var responseJson;

  Future<dynamic> getAll(String endpoint) async {
    try {
      final response = await http
          .get(Uri.http(_baseUrl, endpoint))
          .timeout(Duration(seconds: 15));

      print(response.statusCode);

      responseJson = await _response(response);
    } on SocketException {
      throw FetchDataException("Sem conexão com o servidor");
    } on TimeoutException {
      throw FetchDataException("O servidor demorou muito para responder");
    }

    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException("Erro desconhecido");
    }
  }
}
