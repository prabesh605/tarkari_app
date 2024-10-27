import 'package:flutter/material.dart';
import 'package:tarkari_app/features/auth/view/loggin_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Image.asset(
              "assets/icons/vegetable_logo.png",
              alignment: Alignment.centerLeft,
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Service'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Contract'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const LoggingScreen()));
                  },
                  child: const Row(
                    children: [Icon(Icons.person), Text("Log In")],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [Icon(Icons.phone), Text("+977-981111111")],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Follow Us"),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    "f",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // const Spacer(),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text("Logout"),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
