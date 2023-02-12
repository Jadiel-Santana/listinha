import 'package:flutter_modular/flutter_modular.dart';

import 'home/home_module.dart';
import 'settings/settings_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/settings', module: SettingsModule()),
      ];
}
