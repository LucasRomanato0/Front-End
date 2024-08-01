import 'package:clean_arch/app/modules/home/data/datasources/i_update_user_datasource.dart';
import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_update_user_repository.dart';

class UpdateUserRepository implements IUpdateUserRepository {
  final IUpdateUserDatasource _datasource;
  UpdateUserRepository(this._datasource);

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
