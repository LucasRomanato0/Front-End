import 'package:clean_arch/app/modules/home/data/datasources/i_delete_user_datasource.dart';
import 'package:clean_arch/app/modules/home/data/repositories/delete_user_repository.dart';
import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_delete_user_repository.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/delete_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'users_mock.dart';
@GenerateNiceMocks([MockSpec<IDeleteUserDatasource>()])
import 'delete_user_usecase_test.mocks.dart';

void main() {
  late MockIDeleteUserDatasource datasource;
  late IDeleteUserRepository repo;
  late IDeleteUserUsecase usecase;

  setUp(() {
    datasource = MockIDeleteUserDatasource();
    repo = DeleteUserRepository(datasource);
    usecase = DeleteUserUsecase(repo);
  });

  group('delete user', () {
    test('quando a requisicao for sucesso', () async {
      var id = '8';

      when(datasource(id)).thenAnswer((_) async => mockDto);
      var res = await usecase(id);

      expect(res.success, isTrue);
      expect(res.body, isA<UserDto>());
      expect(res.message, isNull);
    });

    test('quando a requisicao nao for sucesso', () async {
      var id = '8';

      when(datasource(id)).thenThrow(Exception('ERROR'));
      var res = await usecase(id);

      expect(res.success, isFalse);
      expect(res.body, isNull);
      expect(res.message, isNotNull);
    });
  });
}
