import 'package:clean_arch/app/modules/home/data/datasources/i_delete_user_datasource.dart';
import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_delete_user_repository.dart';

class DeleteUserRepository implements IDeleteUserRepository {
  final IDeleteUserDatasource _datasource;
  DeleteUserRepository(this._datasource);

  @override
  Future<UserDto> call(String id) async {
    try {
      var res = await _datasource(id);

      return UserDto.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
