import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  const SettingsScreen({required this.settings, required this.onSettingsChanged, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState(){
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subt, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
      subtitle: Text(subt),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                    'No gluten', 'Only gluten free meals', settings!.isGlutenFree,
                    (value) {
                  setState(() {
                    settings!.isGlutenFree = value;
                    
                  });
                }),
                _createSwitch(
                    'No lactose', 'Only lactose free meals are showed', settings!.isLactoseFree,
                    (value) {
                  setState(() {
                    settings!.isLactoseFree = value;
                  });
                }),
                _createSwitch(
                    'Vegan', 'Only vegan meals are showed', settings!.isVegan,
                    (value) {
                  setState(() {
                    settings!.isVegan = value;
                  });
                }),
                _createSwitch(
                    'Vegetarian', 'Only vegetarian meals are showed', settings!.isVegetarian,
                    (value) {
                  setState(() {
                    settings!.isVegetarian = value;
                  });
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
