import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String selectedLanguage = "English";
  bool notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('darkMode') ?? false;
      selectedLanguage = prefs.getString('language') ?? "English";
      notificationsEnabled = prefs.getBool('notifications') ?? true;
    });
  }

  void _toggleDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', value);
    setState(() => isDarkMode = value);
  }

  void _changeLanguage(String? language) async {
    if (language == null) return; // Ensure language is not null
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    setState(() => selectedLanguage = language);
  }

  void _toggleNotifications(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications', value);
    setState(() => notificationsEnabled = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text("Dark Mode"),
              value: isDarkMode,
              onChanged: _toggleDarkMode,
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text("Language"),
              subtitle: Text(selectedLanguage),
              trailing: DropdownButton<String>(
                value: selectedLanguage,
                items: ["English", "French"]
                    .map((lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                        ))
                    .toList(),
                onChanged: _changeLanguage,
              ),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text("Enable Notifications"),
              value: notificationsEnabled,
              onChanged: _toggleNotifications,
            ),
          ],
        ),
      ),
    );
  }
}
