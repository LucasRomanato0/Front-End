import 'package:clean_arch/app/modules/home/domain/repositories/i_get_users_repository.dart';
import 'package:clean_arch/app/modules/shared/response/response_presentation.dart';

abstract class IGetUsersUsecase {
  Future<ResponsePresentation> call(); // call() = GetUsersRepository.call()
}

class GetUsersUsecase implements IGetUsersUsecase {
  final IGetUsersRepository _repository;
  GetUsersUsecase(this._repository);

  @override
  Future<ResponsePresentation> call() async {
    try {
      var res = await _repository();
      return ResponsePresentation(success: true, body: res);
    } catch (e) {
      return ResponsePresentation(success: false, message: e.toString());
    }
  }
}
