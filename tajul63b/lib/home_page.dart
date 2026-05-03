import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext c) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 62, 236, 114),
      elevation: 2,
      automaticallyImplyLeading: false,
      title: const Text(
        'SebaWala',
        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      actions: [
        for (var i in [Icons.settings, Icons.person])
          IconButton(
            icon: Icon(i, color: Colors.black87),
            onPressed: () {},
          ),
        Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () => Scaffold.of(ctx).openEndDrawer(),
          ),
        ),
      ],
    ),
    endDrawer: const AppDrawer(),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Every Service.\nOne Platform.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 214, 48, 48),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Connect with the best professionals — in just a few seconds.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 236, 5, 194),
          ),
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (_, c) => Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(
              6,
              (_) => Container(
                width: (c.maxWidth / 3) - 20,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext c) => Drawer(
    backgroundColor: Colors.lightGreen,
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'SebaWala',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 235, 235, 238),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                CircleAvatar(radius: 24, child: Text('T')),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Tajul'), Text('tajulnine9@gmail.com')],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('NAVIGATION'),
          ),
          ...[
            [Icons.home_outlined, 'Home', '/home'],
            [Icons.work_outline, 'Services', null],
            [Icons.dashboard_outlined, 'Dashboard', null],
          ].map(
            (e) => ListTile(
              leading: Icon(e[0] as IconData),
              title: Text(e[1] as String),
              onTap: () {
                Navigator.pop(c);
                if (e[2] != null) {
                  Navigator.pushReplacementNamed(c, e[2] as String);
                }
              },
            ),
          ),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(c);
              Navigator.pushReplacementNamed(c, '/login');
            },
          ),
        ],
      ),
    ),
  );
}
