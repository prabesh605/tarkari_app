import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/models/response/response_status.dart';
import 'package:tarkari_app/core/models/services/network/network_connection.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tarkari_app/core/widgets/drawer.dart';
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
      return null;
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
        title: const Text(
          "Tarkari Sewa",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,

        // backgroundColor: const Color(0xffA6E079),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const LoggingScreen()));
        //     },
        //   ),
        // ],
      ),
      drawer: const DrawerWidget(),
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
              const SizedBox(
                height: 10,
              ),
              // const Text(
              //   "Fresh Products",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: itemsProviderState.when(
                  initial: () => _buildInitialState(),
                  progress: () => const Center(
                    child: Text(''),
                  ),
                  error: (error) =>
                      _buildErrorStateForCategory(error.toString()),
                  success: (productResponse) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productResponse.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final categoryName =
                                productResponse.data[index].subCategoryName;
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xffA6E079).withOpacity(0.2),
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    categoryName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: itemsProviderState.when(
                  initial: () => _buildInitialState(),
                  progress: () => Center(
                    child: SkeletonLoader(
                      builder: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[300],
                                ),
                                height: 200,
                                width: double.infinity,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  error: (error) => _buildErrorState(error.toString(), () {
                    _refresh();
                  }),
                  success: (productResponse) =>
                      _buildProductList(productResponse, ref),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInitialState() {
  return const Center(child: Text("Welcome to Tarkari Sewa!"));
}

Widget _buildErrorStateForCategory(String error) {
  return const Center(
    child: Text(''),
    // child: Text('Something wrong while fetching data'),
  );
}

Widget _buildErrorState(String error, onPressed) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Icon(
        Icons.error_outline,
        size: 50,
        color: Colors.red,
      ),
      const SizedBox(height: 10),
      const Text(
        "Oops! Something went wrong.",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 5),
      Text(
        error,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[700],
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.blue,
        ),
        onPressed: onPressed,
        child: const Text(
          "Retry",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ],
  );
}

Widget _buildProductList(ProductResponse productResponse, WidgetRef ref) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Fresh Products",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const SizedBox(
        height: 10,
      ),
      GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: productResponse.data
            .expand((subCategory) => subCategory.materials)
            .toList()
            .length,
        itemBuilder: (context, index) {
          final flattenedMaterials = productResponse.data
              .expand((subCategory) => subCategory.materials)
              .toList();
          final material = flattenedMaterials[index];
          final subCategoryName = productResponse.data
              .firstWhere(
                (subCategory) => subCategory.materials.contains(material),
              )
              .subCategoryName;

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemScreen(material, subCategoryName
                      //  material.subCategoryName,
                      ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffA6E079).withOpacity(0.2),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      ApiConstants.baseurl + material.thumbnail,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    material.fullName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    subCategoryName,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Price: ${material.publicPurchasePrice} /Per Kg',
                    style: const TextStyle(fontSize: 12),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      final exists = ref.read(cartProvider).any((item) =>
                          item.materialInfoID == material.materialInfoID);
                      if (exists) {
                        showErrorToast(
                            '${material.fullName} already added to cart!');
                      } else {
                        ref.read(cartProvider.notifier).addToCart(material);
                        showSuccessToast('${material.fullName} added to cart!');
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              width: 1.0,
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add to Cart",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.shopping_cart,
                              size: 14,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ),
                  // ElevatedButton.icon(
                  //   iconAlignment: IconAlignment.end,
                  //   onPressed: () async {
                  //     // await LocalDatabase().addCartItem(material);
                  //     final exists = ref.read(cartProvider).any(
                  //         (item) => item.materialInfoID == material.materialInfoID);
                  //     if (exists) {
                  //       showErrorToast(
                  //           '${material.fullName} already added to cart!');
                  //     } else {
                  //       ref.read(cartProvider.notifier).addToCart(material);
                  //       showSuccessToast('${material.fullName} added to cart!');
                  //     }
                  //   },
                  //   label: const Text(
                  //     "Add",
                  //     style: TextStyle(fontSize: 18),
                  //   ),
                  //   icon: const Icon(Icons.shopping_cart),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    ],
  );
}
// Widget _buildProductList(ProductResponse productResponse, WidgetRef ref) {
//   return ListView.builder(
//     physics: const NeverScrollableScrollPhysics(),
//     shrinkWrap: true,
//     itemCount: productResponse.data.length,
//     itemBuilder: (context, index) {
//       final subCategory = productResponse.data[index];
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Subcategory title
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//             child: Text(
//               subCategory.subCategoryName,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Column(
//             children: subCategory.materials.map((material) {
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           ItemScreen(material, subCategory.subCategoryName),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: const Color(0xffA6E079).withOpacity(0.2),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Center(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.network(
//                               ApiConstants.baseurl + material.thumbnail,
//                               height: 200,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Text(
//                         material.fullName,
//                         style: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                                 'Price: ${material.publicPurchasePrice} /Per Kg'),
//                             ElevatedButton.icon(
//                               iconAlignment: IconAlignment.end,
//                               onPressed: () async {
//                                 // await LocalDatabase().addCartItem(material);
//                                 final exists = ref.read(cartProvider).any(
//                                     (item) =>
//                                         item.materialInfoID ==
//                                         material.materialInfoID);
//                                 if (exists) {
//                                   showErrorToast(
//                                       '${material.fullName} already added to cart!');
//                                 } else {
//                                   ref
//                                       .read(cartProvider.notifier)
//                                       .addToCart(material);
//                                   showSuccessToast(
//                                       '${material.fullName} added to cart!');
//                                 }
//                               },
//                               label: const Text(
//                                 "Add",
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                               icon: const Icon(Icons.shopping_cart),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       );
//     },
//   );
// }
