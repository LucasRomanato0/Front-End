import 'package:clean_arch/app/modules/home/data/datasources/i_get_users_datasource.dart';
import 'package:clean_arch/app/modules/shared/http/http_client.dart';

class GetUsersDatasource implements IGetUsersDatasource {
  final HttpClientAdapter _client;
  GetUsersDatasource(this._client);

  @override
  Future<List<Map<String, dynamic>>> call() async {
    var res = await _client.get('/users');
    return List.from(res);
  }
}
