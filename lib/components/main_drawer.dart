import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).primaryColorLight,
            alignment: Alignment.bottomRight,
            child: Text(
              'Let\'s cook?',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColorDark),
            ),
          ),
          const SizedBox(height: 20,),
          _createItem(Icons.restaurant, 'Meals', () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
          _createItem(Icons.settings, 'Settings', () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS)),
        ],
      ),
    );
  }
}
