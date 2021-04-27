import 'package:yandra_app/models/service.dart';
import 'package:yandra_app/repositories/api_handler.dart';

class ServiceRepository {
  final ApiHelper _apiHelper = ApiHelper();

  Future<List<Service>> getAll() async {
    final response = await _apiHelper.getAll('services') as List;

    List<Service> services =
        response.map((object) => Service.fromJson(object)).toList();

    return services;
  }
}
