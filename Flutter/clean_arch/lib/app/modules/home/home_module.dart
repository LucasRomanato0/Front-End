import 'package:clean_arch/app/modules/home/data/datasources/i_get_user_datasource.dart';
import 'package:clean_arch/app/modules/home/data/datasources/i_get_users_datasource.dart';
import 'package:clean_arch/app/modules/home/data/repositories/add_user_repository.dart';
import 'package:clean_arch/app/modules/home/data/repositories/get_users_repository.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_add_user_repository.dart';
import 'package:clean_arch/app/modules/home/domain/repositories/i_get_users_repository.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/add_user_usecase.dart';
import 'package:clean_arch/app/modules/home/domain/usecases/get_users_usecase.dart';
import 'package:clean_arch/app/modules/home/external/datasources/add_user_datasource.dart';
import 'package:clean_arch/app/modules/home/external/datasources/get_users_datasource.dart';
import 'package:clean_arch/app/modules/home/presentation/controllers/add_controller.dart';
import 'package:clean_arch/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:clean_arch/app/modules/home/presentation/ui/add_page.dart';
import 'package:clean_arch/app/modules/home/presentation/ui/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<IGetUsersDatasource>((i) => GetUsersDatasource(i())),
        Bind.lazySingleton<IGetUsersRepository>((i) => GetUsersRepository(i())),
        Bind.lazySingleton<IGetUsersUsecase>((i) => GetUsersUsecase(i())),

        Bind.lazySingleton<IAddUserDatasource>((i) => AddUserDatasource(i())),
        Bind.lazySingleton<IAddUserRepository>((i) => AddUserRepository(i())),
        Bind.lazySingleton<IAddUserUsecase>((i) => AddUserUsecase(i())),

        // Controllers
        Bind.singleton<HomeController>(
          (i) => HomeController(i<GetUsersUsecase>()),
        ),
        Bind.singleton<AddController>((i) => AddController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const HomePage()),
        ChildRoute('/add', child: (_, __) => const AddPage()),
      ];
}
