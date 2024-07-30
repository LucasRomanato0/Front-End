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
  void binds(i) {
    i.addLazySingleton<IGetUsersDatasource>(GetUsersDatasource.new);
    i.addLazySingleton<IGetUsersRepository>((i) => GetUsersRepository(i.get()));
    i.addLazySingleton<IGetUsersUsecase>((i) => GetUsersUsecase(i.get()));

    // i<GetUsersUsecase>()
    i.addSingleton<HomeController>(
      (i) => HomeController(i.get<GetUsersUsecase>()),
    );
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const HomePage());
  }
}
