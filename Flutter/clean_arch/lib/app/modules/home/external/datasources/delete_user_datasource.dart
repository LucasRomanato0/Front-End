import 'package:clean_arch/app/modules/home/data/datasources/i_delete_user_datasource.dart';
import 'package:clean_arch/app/modules/shared/http/http_client.dart';

class DeleteUserDatasource implements IDeleteUserDatasource {
  final HttpClientAdapter _client;
  DeleteUserDatasource(this._client);

  @override
  Future<Map<String, dynamic>> call(String id) async {
    var res = await _client.delete('/users/$id');

    return Map.from(res);
  }
}
