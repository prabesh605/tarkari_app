import 'dart:ffi';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/models/response/response_status.dart';
import 'package:tarkari_app/core/models/services/network/network_connection.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tarkari_app/core/widgets/toast.dart';
import 'package:tarkari_app/features/cart_screen/providers/cart_provider.dart';
import 'package:tarkari_app/features/home_screen/model/product_model.dart';
import 'package:tarkari_app/features/home_screen/providers/items_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:tarkari_app/features/item_screen/view/item_screen.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

final visibilityProvider = StateProvider<bool>((ref) => true);

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  // Future<void> _refreshData(WidgetRef ref) async {
  //   await ref.read(itemsProvider.notifier).getItemsData();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    final List<String> imagePath = [
      'assets/images/vegetable1.jpg',
      'assets/images/vegetable2.jpg',
      'assets/images/vegetable3.jpg',
      'assets/images/vegetable4.jpg',
      'assets/images/vegetable5.jpg',
    ];
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

    Future<void> _refresh() async {
      await ref.read(itemsProvider.notifier).getItemsData();
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
        backgroundColor: const Color(0xffA6E079),
        actions: const [
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {},
          // ),
        ],
      ),
      // drawer: const DrawerWidget(),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              isVisible
                  ? Container(
                      color: const Color(0xffA6E079).withOpacity(0.2),
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: IconButton(
                            //     onPressed: () {
                            //       ref.read(visibilityProvider.notifier).state =
                            //           false;
                            //     },
                            //     icon: const Icon(Icons.close),
                            //   ),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    "Save up to 50% off on your first order"),
                                IconButton(
                                  onPressed: () {
                                    ref
                                        .read(visibilityProvider.notifier)
                                        .state = false;
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                            const Text(
                              "अब तपाईंहरूलाई ताजा, सस्तो, तथा लोकल तरकारीहरू, जस्तै: आलु, प्याज, अदुवा, लसुन, गोलभेडा आदि, सजिलै छानी-छानी घरमै बसिबसी अर्डर गर्न सक्नुहुन्छ। त्यो पनि बिना कुनै डेलिभरी शुल्क!।",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
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
              Container(
                padding: const EdgeInsets.all(10),
                height: 220,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xffA6E079).withOpacity(0.4),
                      width: 1.0),
                  color: const Color(0xffA6E079).withOpacity(0.2),
                ),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 180.0,
                        autoPlay: true,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          currentIndex.value = index;
                        },
                      ),
                      items: imagePath.map((path) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  path,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          imagePath.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: currentIndex.value == index ? 12 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentIndex.value == index
                                  ? Colors.green
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              itemsProviderState.when(
                initial: () => _buildInitialState(),
                progress: () => Center(
                  child: SkeletonLoader(
                    builder: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 200,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 10,
                                    color: Colors.grey[300],
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    height: 10,
                                    width: 100,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                error: (error) => _buildErrorState(error.toString()),
                success: (productResponse) =>
                    _buildProductList(productResponse, ref),
              ),
            ],
          ),
        ),
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
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
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
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ItemScreen(material, subCategory.subCategoryName),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffA6E079).withOpacity(0.2),
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
                              height: 200,
                              fit: BoxFit.cover,
                            ),
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
                                } else {
                                  ref
                                      .read(cartProvider.notifier)
                                      .addToCart(material);
                                  showSuccessToast(
                                      '${material.fullName} added to cart!');
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
                ),
              );
            }).toList(),
          ),
        ],
      );
    },
  );
}
