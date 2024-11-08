import 'package:flutter/material.dart';
import 'package:tarkari_app/core/widgets/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: const Color(0xffA6E079),
        ),
        // drawer: const DrawerWidget(),
        body: const Center(
          child: Text("Not Available right now"),
        )
        // SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         // Profile picture
        //         Center(
        //           child: Stack(
        //             children: [
        //               const CircleAvatar(
        //                 radius: 50,
        //                 backgroundImage: AssetImage('assets/images/potato.jpg'),
        //               ),
        //               Positioned(
        //                 bottom: 0,
        //                 right: 0,
        //                 child: Container(
        //                   decoration: const BoxDecoration(
        //                     shape: BoxShape.circle,
        //                     color: const Color(0xffA6E079),
        //                   ),
        //                   child: IconButton(
        //                     icon: const Icon(Icons.edit, color: Colors.white),
        //                     onPressed: () {},
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //         const SizedBox(height: 20),
        //         // User's name
        //         const Text(
        //           "John Doe",
        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        //         ),
        //         const SizedBox(height: 10),

        //         _buildEditableField("Email", "john.doe@example.com"),
        //         const SizedBox(height: 20),
        //         _buildEditableField("Phone", "+977-981111111"),
        //         const SizedBox(height: 20),
        //         _buildEditableField("Address", "Kathmandu, Nepal"),

        //         const SizedBox(height: 30),

        //         ElevatedButton.icon(
        //           onPressed: () {},
        //           icon: const Icon(
        //             Icons.save,
        //             color: Colors.white,
        //           ),
        //           label: const Text(
        //             "Save",
        //             style: TextStyle(color: Colors.white),
        //           ),
        //           style: ElevatedButton.styleFrom(
        //             padding:
        //                 const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        //             backgroundColor: const Color(0xffA6E079),
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(20),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }

  Widget _buildEditableField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: value,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            prefixIcon: label == "Email"
                ? const Icon(Icons.email)
                : label == "Phone"
                    ? const Icon(Icons.phone)
                    : const Icon(Icons.location_on),
          ),
        ),
      ],
    );
  }
}
