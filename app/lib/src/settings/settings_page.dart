import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/stores/app_store.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        'Tema',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      RadioListTile<ThemeMode>(
                        title: const Text('Sistema'),
                        contentPadding: EdgeInsets.zero,
                        value: ThemeMode.system,
                        groupValue: appStore.themeMode.value,
                        onChanged: appStore.changeThemeMode,
                      ),
                      RadioListTile<ThemeMode>(
                        title: const Text('Claro'),
                        contentPadding: EdgeInsets.zero,
                        value: ThemeMode.light,
                        groupValue: appStore.themeMode.value,
                        onChanged: appStore.changeThemeMode,
                      ),
                      RadioListTile<ThemeMode>(
                        title: const Text('Escuro'),
                        contentPadding: EdgeInsets.zero,
                        value: ThemeMode.dark,
                        groupValue: appStore.themeMode.value,
                        onChanged: appStore.changeThemeMode,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Controle de dados',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: appStore.deleteSettings,
                        child: Text(
                          'Apagar cache e reiniciar o app',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
