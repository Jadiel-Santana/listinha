import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomePage()),
      ];
}
