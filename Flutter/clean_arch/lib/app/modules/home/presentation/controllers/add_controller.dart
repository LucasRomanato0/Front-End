import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/add_user_usecase.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/update_user_usecase.dart';
import 'package:clean_arch/app/modules/shared/response/response_presentation.dart';

class AddController {
  final IAddUserUsecase _usecase;
  final IUpdateUserUsecase _updateUserUsecase;
  AddController(this._usecase, this._updateUserUsecase);

  Future<ResponsePresentation> addContact(UserDto dto) async {
    return await _usecase(dto);
  }

  Future<ResponsePresentation> editContact(UserDto dto) async {
    return await _updateUserUsecase(dto);
  }
}
