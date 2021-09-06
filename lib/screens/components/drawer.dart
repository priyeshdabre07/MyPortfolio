import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                // color: Colors.blue,
                ),
            child: Text('Cakes For You'),
          ),
          ListTile(
            title: const Text('Work'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('About Me'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
