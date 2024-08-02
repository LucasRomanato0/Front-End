import 'package:clean_arch/app/modules/home/data/datasources/i_get_user_datasource.dart';
import 'package:clean_arch/app/modules/home/data/repositories/add_user_repository.dart';
import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/add_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'users_mock.dart';
@GenerateNiceMocks([MockSpec<IAddUserDatasource>()])
import 'add_user_usecase_test.mocks.dart';

void main() {
  late MockIAddUserDatasource datasource;
  late AddUserRepository repo;
  late AddUserUsecase usecase;

  setUp(() {
    datasource = MockIAddUserDatasource();
    repo = AddUserRepository(datasource);
    usecase = AddUserUsecase(repo);
  });

  group('add user', () {
    test('quando a requisicao for sucesso', () async {
      var dto = UserDto();

      when(datasource(dto)).thenAnswer((_) async => mockDto);
      var res = await usecase(dto);

      expect(res.success, isTrue);
      expect(res.body, isA<UserDto>());
      expect(res.message, isNull);
    });

    test('quando a requisicao nao for sucesso', () async {
      var dto = UserDto();

      when(datasource(dto)).thenThrow(Exception('ERROR'));
      var res = await usecase(dto);

      expect(res.success, isFalse);
      expect(res.body, isNull);
      expect(res.message, isNotNull);
    });
  });
}
