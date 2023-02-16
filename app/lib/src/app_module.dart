import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

import 'home/home_module.dart';
import 'settings/services/settings_service.dart';
import 'settings/settings_module.dart';
import 'shared/services/realm_config.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        Bind.factory<SettingsService>((i) => SettingsServiceImpl(realm: i())),
        Bind.singleton((i) => AppStore(service: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/settings', module: SettingsModule()),
      ];
}
