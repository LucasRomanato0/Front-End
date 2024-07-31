import 'package:clean_arch/app/modules/home/home_module.dart';
import 'package:clean_arch/app/modules/shared/http/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HttpClientAdapter()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
