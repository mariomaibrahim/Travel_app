import 'package:flutter/material.dart';
import 'drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';
  final Function saveFilters;

  const FiltersScreen(this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلترة'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'summer': false,
                'winter': false,
                'family': false,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: const Text(
                    'الرحلات الصيفية',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('إظهار الرحلات في فصل الصيف فقط'),
                  value: _Summer,
                  onChanged: (newValue) {
                    setState(() {
                      _Summer = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text(
                    'الرحلات الشتوية',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('إظهار الرحلات في فصل الشتاء فقط'),
                  value: _Winter,
                  onChanged: (newValue) {
                    setState(() {
                      _Winter = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text(
                    'الرحلات العائلية',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('إظهار الرحلات العائلية فقط'),
                  value: _Family,
                  onChanged: (newValue) {
                    setState(() {
                      _Family = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
