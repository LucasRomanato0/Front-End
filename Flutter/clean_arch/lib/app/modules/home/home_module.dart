import 'package:clean_arch/app/modules/home/data/datasources/i_get_users_datasource.dart';
import 'package:clean_arch/app/modules/home/data/repositories/get_users_repository.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_get_users_repository.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/get_users_usecase.dart';
import 'package:clean_arch/app/modules/home/external/datasources/get_users_datasource.dart';
import 'package:clean_arch/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:clean_arch/app/modules/home/presentation/ui/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<IGetUsersDatasource>((i) => GetUsersDatasource(i())),
        Bind.lazySingleton<IGetUsersRepository>((i) => GetUsersRepository(i())),
        Bind.lazySingleton<IGetUsersUsecase>((i) => GetUsersUsecase(i())),
        Bind.singleton<HomeController>(
          (i) => HomeController(i<GetUsersUsecase>()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const HomePage()),
      ];
}
