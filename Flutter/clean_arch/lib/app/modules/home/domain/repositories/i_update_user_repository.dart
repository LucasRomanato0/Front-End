import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';

abstract class IUpdateUserRepository {
  Future<UserDto> call(UserDto dto);
}
