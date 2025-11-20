import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/themes/app_theams.dart';

class ThemeDrawer extends StatelessWidget {
  final void Function(String) changeTheme;
  const ThemeDrawer({super.key, required this.changeTheme});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
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
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppThemes.lightMode.colorScheme.primary,
              ),
              width: 24,
              height: 24,
            ),
            title: Text(
              'Light Theme',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onTap: () {
              changeTheme("lightMode");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppThemes.darkMode.colorScheme.primary,
              ),
              width: 24,
              height: 24,
            ),
            title: Text(
              'Dark Theme',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onTap: () {
              changeTheme("darkMode");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppThemes.primaryMode.colorScheme.primary,
              ),
              width: 24,
              height: 24,
            ),
            title: Text(
              'Primary Theme',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onTap: () {
              changeTheme("primaryMode");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    AppThemes.darkCyanMode.colorScheme.primary,
                    AppThemes.darkCyanMode.colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              width: 24,
              height: 24,
            ),
            title: Text(
              'dark cyan Theme',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onTap: () {
              changeTheme("darkCyanMode");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    AppThemes.pinkMode.colorScheme.primary,
                    AppThemes.pinkMode.colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              width: 24,
              height: 24,
            ),
            title: Text(
              'pink theme',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onTap: () {
              changeTheme("pinkMode");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    AppThemes.brownMode.colorScheme.primary,
                    AppThemes.brownMode.colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              width: 24,
              height: 24,
            ),
            title: Text(
              'brown theme',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onTap: () {
              changeTheme("brownMode");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
