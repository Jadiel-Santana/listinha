import 'package:listinha/src/shared/services/models/settings_model.dart';
import 'package:realm/realm.dart';

abstract class SettingsService {
  SettingsModel getSettings();
  void saveSettings({required String themeModeName, DateTime? syncDate});
  void deleteAll();
}

class SettingsServiceImpl implements SettingsService {
  final Realm realm;

  SettingsServiceImpl({
    required this.realm,
  });

  @override
  SettingsModel getSettings() => realm.all<SettingsModel>().first;

  @override
  void saveSettings({required String themeModeName, DateTime? syncDate}) {
    final model = getSettings();
    realm.write(() {
      model
        ..themeModeName = themeModeName
        ..syncDate = syncDate;
    });
  }

  @override
  void deleteAll() => realm.deleteAll();
}
