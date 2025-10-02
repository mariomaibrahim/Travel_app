import 'package:flutter/material.dart';
import 'package:travel_app/screens/filters_screen.dart';
import 'package:travel_app/utils/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 28, color: primaryColor),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Colors.grey),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      hoverColor: primaryColor.withOpacity(0.1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, primaryColor.withOpacity(0.8)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Center(
              child: Text(
                "دليلك السياحي",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          buildListTile(
            icon: Icons.travel_explore,
            title: 'الرحلات',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(thickness: 1, indent: 20, endIndent: 20),
          buildListTile(
            icon: Icons.checklist_outlined,
            title: 'الفلترة',
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Mariam Ibrahim",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
