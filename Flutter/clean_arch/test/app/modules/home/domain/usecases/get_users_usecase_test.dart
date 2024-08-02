import 'package:clean_arch/app/modules/home/data/datasources/i_get_users_datasource.dart';
import 'package:clean_arch/app/modules/home/data/repositories/get_users_repository.dart';
import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_get_users_repository.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/get_users_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'users_mock.dart';
@GenerateNiceMocks([MockSpec<IGetUsersDatasource>()])
import 'get_users_usecase_test.mocks.dart';

void main() {
  late IGetUsersDatasource getUsersDatasource;
  late IGetUsersRepository getUsersRepository;
  late IGetUsersUsecase getUsersUsecase;

  setUp(() {
    getUsersDatasource = MockIGetUsersDatasource();
    getUsersRepository = GetUsersRepository(getUsersDatasource);
    getUsersUsecase = GetUsersUsecase(getUsersRepository);
  });

  test('testar se foi sucesso na requisicao', () async {
    when(getUsersDatasource()).thenAnswer((_) async => mockList);

    var res = await getUsersUsecase();

    expect(res.success,
        isTrue); // quando chamar um metodo o que me retornar => mock
    expect(res.body, isA<List<UserDto>>()); // verificar se voltou lista de obj
  });

  test('testar se nao foi sucesso na requisicao', () async {
    when(getUsersDatasource()).thenThrow(Exception('ERROR'));

    var res = await getUsersUsecase();

    expect(res.success, isFalse);
    expect(res.body, isNull);
    expect(res.message, isA<String>());
  });
}
