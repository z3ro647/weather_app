import 'package:basic_weather_app/providers/theme_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool isCelsius = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // Temperature Unit
            _SettingsTile(
              title: 'Temperature Unit',
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1F36),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Switch(
                  value: isCelsius,
                  onChanged: (value) {
                    setState(() => isCelsius = value);
                    // TODO: Store unit preference with SharedPreferences if needed
                  },
                  activeColor: Colors.lightBlueAccent,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Dark Mode
            _SettingsTile(
              title: 'Dark Mode',
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
                activeColor: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final Widget trailing;

  const _SettingsTile({required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F36),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const Spacer(),
          trailing,
        ],
      ),
    );
  }
}
