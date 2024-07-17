import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/get_users_usecase.dart';

class HomeController {
  final GetUsersUsecase _usecase;
  HomeController(this._usecase);

  List<UserDto> contacts = [];

  Future<void> getData() async {
    var res = await _usecase();

    if (!res.success) {
      contacts = [];
      print(res.message);
    } else {
      contacts = res.body as List<UserDto>;
    }
  }
}
