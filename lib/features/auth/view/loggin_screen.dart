import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:tarkari_app/core/models/response/response_status.dart';
import 'package:tarkari_app/features/auth/providers/login_provider.dart';
import 'package:tarkari_app/features/home/home.dart';

class LoggingScreen extends HookConsumerWidget {
  // Change to HookConsumerWidget
  const LoggingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCon = TextEditingController();
    final passwordCon = TextEditingController();
    final loginProviderState = ref.watch(loginProvider);

    String _appVersion = "";

    // Future<void> _getAppVersion() async {
    //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //   _appVersion = packageInfo.version;
    // }

    // _getAppVersion(); // Get the app version inside the build method
    // ref.listen(loginProvider, (previous, next) {
    //   next.maybeWhen(
    //       orElse: () {},
    //       success: (_) {
    //         // EasyLoading.showSuccess("Login Successful");
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => const Home()),
    //         );
    //       },
    //       error: (e) {
    //         // EasyLoading.showError(e.toString());
    //       });
    // });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset("assets/icons/logo.png"),
                  const Text(
                    "A1 Tarkari shop",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Text("स्वस्थ जीवनको लागि ताजा तरकारी र राम्रो खाना! "),
                  // Text('Version: $_appVersion') // Display app version here
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: emailCon, // Attach the controller
                        decoration: InputDecoration(
                          hintText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: const Color(0xffA6E079).withOpacity(0.2),
                          filled: true,
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: passwordCon, // Attach the controller
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: const Color(0xffA6E079).withOpacity(0.2),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Trigger login action using ref.read
                          // ref.read(loginProvider.notifier).login(
                          //       username: emailCon.text,
                          //       password: passwordCon.text,
                          //     );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: const Color(0xffA6E079),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      if (loginProviderState is ResponseStatusProgress)
                        const CircularProgressIndicator(), // Show progress
                      if (loginProviderState is ResponseStatusError)
                        Text(
                          (loginProviderState as ResponseStatusError)
                              .error
                              .toString(),
                          style: const TextStyle(color: Colors.red),
                        ), // Show error
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
