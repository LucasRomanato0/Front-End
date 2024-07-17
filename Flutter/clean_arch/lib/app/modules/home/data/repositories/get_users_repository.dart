import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_get_users_repository.dart';
import 'package:clean_arch/app/modules/home/external/datasources/get_users_datasource.dart';

class GetUsersRepository implements IGetUsersRepository {
  final GetUsersDatasource _datasource;
  GetUsersRepository(this._datasource);

  @override
  Future<List<UserDto>> call() async {
    try {
      var res = await _datasource();
      List<UserDto> list = [];
      for (var e in res) {
        list.add(UserDto.fromMap(e));
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }
}
