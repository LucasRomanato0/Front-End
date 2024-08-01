import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/delete_user_usecase.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/get_users_usecase.dart';
import 'package:clean_arch/app/modules/shared/response/response_presentation.dart';

class HomeController {
  final IGetUsersUsecase _usecase;
  final IDeleteUserUsecase _deleteUsecase;
  HomeController(this._usecase, this._deleteUsecase);

  List<UserDto> contacts = [];

  Future<void> getData() async {
    var res = await _usecase();

    if (!res.success) {
      contacts = [];
      print(res.message);
      return;
    }

    contacts = res.body as List<UserDto>;
  }

  Future<ResponsePresentation> deleteData(String? id) async {
    if (id == null) {
      print('id is null');
      return ResponsePresentation(success: false);
    }

    var res = await _deleteUsecase(id);

    if (!res.success) {
      print(res.message);
    }

    return res;
    // contacts.removeWhere((element) => element.id == id);
  }
}
