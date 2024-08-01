import 'package:clean_arch/app/modules/home/data/datasources/i_update_user_datasource.dart';
import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/shared/http/http_client.dart';

class UpdateUserDatasource implements IUpdateUserDatasource {
  final HttpClientAdapter _client;
  UpdateUserDatasource(this._client);

  @override
  Future<Map<String, dynamic>> call(UserDto dto) async {
    var res = await _client.put('/users/${dto.id}', data: dto.toMap());
    return Map.from(res);
  }
}
