import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_add_user_repository.dart';
import 'package:clean_arch/app/modules/shared/response/response_presentation.dart';

abstract class IAddUserUsecase {
  Future<ResponsePresentation> call(UserDto dto);
}

class AddUserUsecase implements IAddUserUsecase {
  final IAddUserRepository _repo;
  AddUserUsecase(this._repo);

  @override
  Future<ResponsePresentation> call(UserDto dto) async {
    try {
      var res = await _repo(dto);

      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, body: e.toString());
    }
  }
}
