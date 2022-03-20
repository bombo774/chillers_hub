class SettingsModel {
  final String name;
  SettingsModel({required this.name});
}

List<SettingsModel> settingsMenu = [
  SettingsModel(name: "Summary"),
  SettingsModel(name: "Profile"),
  SettingsModel(name: "Password"),
  SettingsModel(name: "Notifications"),
  SettingsModel(name: "Email"),
  SettingsModel(name: "Address"),
  SettingsModel(name: "Subscription"),
];
