import 'package:clean_arch/app/modules/home/data/datasources/i_delete_user_datasource.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_delete_user_repository.dart';

class DeleteUserRepository implements IDeleteUserRepository {
  final IDeleteUserDatasource _datasource;
  DeleteUserRepository(this._datasource);

  @override
  Future<Map<String, dynamic>> call(String id) async {
    try {
      var res = await _datasource(id);

      return res;
    } catch (e) {
      rethrow;
    }
  }
}
