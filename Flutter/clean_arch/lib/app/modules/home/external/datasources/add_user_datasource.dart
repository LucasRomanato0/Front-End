import 'package:clean_arch/app/modules/home/data/datasources/i_get_user_datasource.dart';
import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/shared/http/http_client.dart';

class AddUserDatasource implements IAddUserDatasource {
  final HttpClientAdapter _client;
  AddUserDatasource(this._client);

  @override
  Future<Map<String, dynamic>> call(UserDto dto) async {
    var res = await _client.post('/users', data: dto.toMap());

    return Map.from(res);
  }
}
