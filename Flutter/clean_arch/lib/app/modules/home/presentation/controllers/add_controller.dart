import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/add_user_usecase.dart';
import 'package:clean_arch/app/modules/shared/response/response_presentation.dart';

class AddController {
  final IAddUserUsecase _usecase;
  AddController(this._usecase);

  Future<ResponsePresentation> addContact(UserDto dto) async {
    return await _usecase(dto);
  }
}
