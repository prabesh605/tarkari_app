import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/widgets/toast.dart';
import 'package:tarkari_app/features/about_us/provider/contact_us_provider.dart';

final isLoadingProvider = StateProvider<bool>((ref) => false);

class ContactPage extends HookConsumerWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final subjectController = TextEditingController();
    final messageController = TextEditingController();
    final submitMessage = ref.read(contactUsProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'We\'re here to help!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Feel free to reach out to us for any inquiries or support. Our team is always ready to assist you.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact Details:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.email, color: Colors.green),
                title: Text('Email'),
                subtitle: Text('support@a1tarkarishop.com'),
              ),
              const ListTile(
                leading: Icon(Icons.phone, color: Colors.green),
                title: Text('Phone'),
                subtitle: Text('+1 234 567 890'),
              ),
              const ListTile(
                leading: Icon(Icons.location_on, color: Colors.green),
                title: Text('Address'),
                subtitle: Text('123 Tarkari Street, Green City, Earth'),
              ),
              const SizedBox(height: 20),
              // const Text(
              //   'Follow Us:',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     IconButton(
              //       icon: const Icon(Icons.facebook, color: Colors.blue),
              //       onPressed: () {
              //         // Add your Facebook URL
              //       },
              //     ),
              //     // IconButton(
              //     //   icon: const Icon(Icons.facebook, color: Colors.pink),
              //     //   onPressed: () {
              //     //     // Add your Instagram URL
              //     //   },
              //     // ),
              //     // IconButton(
              //     //   icon: const Icon(Icons.facebook, color: Colors.blueAccent),
              //     //   onPressed: () {
              //     //     // Add your Twitter URL
              //     //   },
              //     // ),
              //   ],
              // ),
              // const SizedBox(height: 20),
              const Text(
                'Send Us a Message:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Your Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your name' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Your Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your email' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Your Number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your number' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: subjectController,
                      decoration: const InputDecoration(
                        labelText: 'Your Subject',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your subject' : null,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: messageController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Your Message',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your message' : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          ref.read(isLoadingProvider.notifier).state = true;
                          submitMessage.contactUsProvider(
                            fullName: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                            subject: subjectController.text,
                            message: messageController.text,
                          );
                          ref.read(isLoadingProvider.notifier).state = false;
                          final state = ref.read(contactUsProvider);
                          state.when(
                              initial: () {},
                              progress: () {},
                              error: (error) {
                                showErrorToast('Something when Wrong');
                              },
                              success: (data) {
                                formKey.currentState?.reset();
                                showSuccessToast("Sucessfully Submitted");
                              });
                        }
                      },
                      icon: const Icon(Icons.send),
                      label: const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
