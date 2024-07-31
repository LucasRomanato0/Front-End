import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';

abstract class IAddUserDatasource {
  Future<Map<String, dynamic>> call(UserDto dto);
}
