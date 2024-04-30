import 'package:flutter/material.dart';
import 'package:todoapps/pages/login.dart';
import 'package:todoapps/pages/settings_page.dart';
import 'package:todoapps/utils/heat_map.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // logo
          const DrawerHeader(
            child: Center(
              child: Icon(Icons.note),
            ),
          ),

          // home title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              title: const Text('H O M E'),
              leading: const Icon(Icons.home),
              onTap: () => Navigator.pop(context),
            ),
          ),

          // settings title
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: const Text('S E T T I N G S'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ),

          // log out
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: const Text('L O G O U T'),
              leading: const Icon(Icons.arrow_circle_left_outlined),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const loginPages(
                      title: '',
                    ),
                  ),
                );
              },
            ),
          ),
          // calendar
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: const Text('C A L E N D A R'),
              leading: const Icon(Icons.calendar_month),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHeatMap(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
