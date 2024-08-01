import 'package:clean_arch/app/modules/home/domain/repositories/i_delete_user_repository.dart';
import 'package:clean_arch/app/modules/shared/response/response_presentation.dart';

abstract class IDeleteUserUsecase {
  Future<ResponsePresentation> call(String id);
}

class DeleteUserUsecase implements IDeleteUserUsecase {
  final IDeleteUserRepository _repo;
  DeleteUserUsecase(this._repo);

  @override
  Future<ResponsePresentation> call(String id) async {
    try {
      var res = await _repo(id);

      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
