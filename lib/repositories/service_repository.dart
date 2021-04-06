import 'dart:convert';

import 'package:yandra_app/models/service.dart';
import 'package:http/http.dart' as http;

class ServiceRepository {
  Future<List<Service>> getAll() async {
    final response = await http.get(Uri.http('192.168.0.121:3000', 'services'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      List<Service> services =
          json.map((obj) => Service.fromJson(obj)).toList();
      return services;
    } else {
      throw Exception("Failed to load services");
    }
  }
}
