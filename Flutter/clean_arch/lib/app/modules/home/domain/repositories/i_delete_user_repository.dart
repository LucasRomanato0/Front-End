import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';

abstract class IDeleteUserRepository {
  Future<UserDto> call(String id);
}
