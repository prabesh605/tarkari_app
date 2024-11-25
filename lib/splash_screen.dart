import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/storage_constants.dart';
import 'package:tarkari_app/features/home/home.dart';
import 'package:tarkari_app/features/home_screen/providers/items_provider.dart';

// import 'package:tarkari_app/features/home_screen/providers/items_provider.dart';
// @RoutePage()
class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // ref.read(itemsProvider.notifier).getItemsData();
      });
      ref.read(itemsProvider.notifier).getItemsData();
      final timer = Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      });

      return timer.cancel;
    }, []);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          ImageConstant.splashBackground,
          // "assets/images/background.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
