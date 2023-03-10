import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:listinha/src/shared/stores/app_store.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.syncDate,
    );

    final syncDate = appStore.syncDate.value;
    var syncDateText = 'Nunca';

    if (syncDate != null) {
      final format = DateFormat('dd/MM/yyyy às hh:mm');
      syncDateText = format.format(syncDate);
    }

    return NavigationDrawer(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sincronizar'),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    syncDateText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.popAndPushNamed(context, '/settings');
        }
      },
    );
  }
}
