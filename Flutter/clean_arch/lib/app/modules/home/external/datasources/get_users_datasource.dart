import 'package:clean_arch/app/modules/home/data/datasources/i_get_users_datasource.dart';
import 'package:dio/dio.dart';

class GetUsersDatasource implements IGetUsersDatasource {
  @override
  Future<List<Map<String, dynamic>>> call() async {
    final httpClient = Dio();
    httpClient.options.baseUrl = 'https://669531bc4bd61d8314ca6f94.mockapi.io';
    httpClient.options.connectTimeout = const Duration(seconds: 5);
    httpClient.options.receiveTimeout = const Duration(seconds: 3);

    var res = await httpClient.get('/users');
    return List.from(res.data);
  }
}
