import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_update_user_repository.dart';
import 'package:clean_arch/app/modules/shared/response/response_presentation.dart';

abstract class IUpdateUserUsecase {
  Future<ResponsePresentation> call(UserDto dto);
}

class UpdateUserUsecase implements IUpdateUserUsecase {
  final IUpdateUserRepository _repo;
  UpdateUserUsecase(this._repo);

  @override
  Future<ResponsePresentation> call(UserDto dto) async {
    try {
      var res = await _repo(dto);

      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
