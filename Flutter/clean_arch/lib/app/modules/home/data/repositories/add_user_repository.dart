import 'package:clean_arch/app/modules/home/data/datasources/i_get_user_datasource.dart';
import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_add_user_repository.dart';

class AddUserRepository implements IAddUserRepository {
  final IAddUserDatasource _datasource;
  AddUserRepository(this._datasource);

  @override
  Future<UserDto> call(UserDto dto) async {
    try {
      var res = await _datasource(dto);

      return UserDto.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
