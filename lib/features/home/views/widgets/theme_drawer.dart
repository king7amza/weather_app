import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/themes/app_theams.dart';

class ThemeDrawer extends StatelessWidget {
  final void Function(ThemeData) changeTheme;
  const ThemeDrawer({super.key, required this.changeTheme});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Select Theme',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_4),
            title: const Text('Light Theme'),
            onTap: () {
              changeTheme(AppThemes.lightMode);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.brightness_2),
            title: const Text('Dark Theme'),
            onTap: () {
              changeTheme(AppThemes.darkMode);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.brightness_auto),
            title: const Text('Primary Theme'),
            onTap: () {
              changeTheme(AppThemes.primaryMode);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}