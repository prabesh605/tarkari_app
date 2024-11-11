import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/models/response/response_status.dart';
import 'package:tarkari_app/core/models/services/network/network_connection.dart';
import 'package:tarkari_app/core/widgets/drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tarkari_app/core/widgets/toast.dart';
import 'package:tarkari_app/data_sync/db/sqflite_db.dart';
import 'package:tarkari_app/features/cart_screen/providers/cart_provider.dart';
import 'package:tarkari_app/features/home_screen/model/product_model.dart';
import 'package:tarkari_app/features/home_screen/providers/items_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';

final visibilityProvider = StateProvider<bool>((ref) => true);

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  // Future<void> _refreshData(WidgetRef ref) async {
  //   await ref.read(itemsProvider.notifier).getItemsData();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<String?> getDeviceId() async {
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

        return androidInfo.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor;
      }
      return null;
    }

    void displayDeviceId() async {
      String? deviceId = await getDeviceId();
      print('Device ID: $deviceId');
    }

    final isConnected = useState<bool>(true);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        bool connectionStatus = await NetworkConnectionCheck.checkConnection();
        isConnected.value = connectionStatus;
        // displayDeviceId();

        if (connectionStatus) {
          final itemsState = ref.read(itemsProvider);
          if (itemsState is! ResponseStatusProgress &&
              itemsState is! ResponseStatusSuccess) {
            ref.read(itemsProvider.notifier).getItemsData();
          }
        }
      });
    }, []);
    // useEffect(() {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     ref.read(itemsProvider.notifier).getItemsData();
    //   });
    // }, []);
    final isVisible = ref.watch(visibilityProvider);
    final itemsProviderState = ref.watch(itemsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("A1 Tarkari shop"),
        actions: const [
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {},
          // ),
        ],
      ),
      // drawer: const DrawerWidget(),
      body: Column(
        children: [
          if (isVisible)
            Stack(
              children: [
                // Positioned(
                //   top: 0,
                //   right: 0,
                //   child: IconButton(
                //     onPressed: () {
                //       ref.read(visibilityProvider.notifier).state = false;
                //       // ref
                //       //     .read(visibilityProvider.notifier)
                //       //     .update((state) => false);
                //     },
                //     icon: const Icon(Icons.close),
                //   ),
                // ),

                Container(
                  color: const Color(0xffA6E079).withOpacity(0.2),
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Save up to 50% off on your first order"),
                        Text(
                          "अब तपाईंहरूलाई ताजा, सस्तो, तथा लोकल तरकारीहरू, जस्तै: आलु, प्याज, अदुवा, लसुन, गोलभेडा आदि, सजिलै छानी-छानी घरमै बसिबसी अर्डर गर्न सक्नुहुन्छ। त्यो पनि बिना कुनै डेलिभरी शुल्क!।",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          if (!isConnected.value)
            Container(
              color: Colors.red.withOpacity(0.2),
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'No internet connection. Please check your network.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          itemsProviderState.when(
            initial: () => _buildInitialState(),
            progress: () => const Center(child: CircularProgressIndicator()),
            error: (error) => _buildErrorState(error.toString()),
            success: (productResponse) =>
                _buildProductList(productResponse, ref),
          ),
        ],
      ),
    );
  }
}

Widget _buildInitialState() {
  return const Center(child: Text("Welcome to A1 Tarkari Shop!"));
}

Widget _buildErrorState(String error) {
  return const Center(
    child:
        // Text('Something wrong while fetching data'),
        Text(''),
  );
}

Widget _buildProductList(ProductResponse productResponse, WidgetRef ref) {
  return Expanded(
    child: ListView.builder(
      itemCount: productResponse.data.length,
      itemBuilder: (context, index) {
        final subCategory = productResponse.data[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subcategory title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text(
                subCategory.subCategoryName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Column(
              children: subCategory.materials.map((material) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                                ApiConstants.baseurl + material.thumbnail,
                                height: 200),
                          ),
                        ),
                      ),
                      Text(
                        material.fullName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Price: ${material.publicPurchasePrice} /Per Kg'),
                            ElevatedButton.icon(
                              iconAlignment: IconAlignment.end,
                              onPressed: () async {
                                // await LocalDatabase().addCartItem(material);
                                final exists = ref.read(cartProvider).any(
                                    (item) =>
                                        item.materialInfoID ==
                                        material.materialInfoID);
                                if (exists) {
                                  showErrorToast(
                                      '${material.fullName} already added to cart!');
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(
                                  //     content: Text('Item already in cart!'),
                                  //     backgroundColor: Colors.orange,
                                  //   ),
                                  // );
                                } else {
                                  ref
                                      .read(cartProvider.notifier)
                                      .addToCart(material);
                                  showSuccessToast(
                                      '${material.fullName} added to cart!');
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(
                                  //       content: Text(
                                  //           '${material.fullName} added to cart!')),
                                  // );
                                }
                              },
                              label: const Text(
                                "Add",
                                style: TextStyle(fontSize: 18),
                              ),
                              icon: const Icon(Icons.shopping_cart),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    ),
  );
}
