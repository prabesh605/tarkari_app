import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/widgets/drawer.dart';
import 'package:tarkari_app/core/widgets/toast.dart';
import 'package:tarkari_app/data_sync/db/sqflite_db.dart';
import 'package:tarkari_app/features/cart_screen/models/order_model.dart';
import 'package:tarkari_app/features/cart_screen/providers/cart_provider.dart';
import 'package:tarkari_app/features/cart_screen/views/customer_form_screen.dart';

// final itemCountProvider = StateProvider.family<int, int>((ref, index) => 1);
final itemCountProvider = StateProvider.family<int, int>((ref, index) {
  final cartItems = ref.watch(cartProvider);
  return cartItems[index].itemCount;
});

final totalCostProvider = Provider<double>((ref) {
  final cartItems = ref.watch(cartProvider);
  double totalCost = 0;

  for (var i = 0; i < cartItems.length; i++) {
    final itemCount = ref.watch(itemCountProvider(i));
    totalCost += cartItems[i].publicPurchasePrice * itemCount;
  }
  return totalCost;
});

class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LocalDatabase _localDatabase = LocalDatabase();
    // final itemCount = ref.watch(itemCountProvider);
    final cartItems = ref.watch(cartProvider);
    final totalCost = ref.watch(totalCostProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        actions: [
          Consumer(
            builder: (context, watch, child) {
              final itemCount = ref.watch(cartProvider).length;
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (itemCount > 0) {
                        ref.watch(cartProvider.notifier).clearCart();

                        for (var i = 0; i < cartItems.length; i++) {
                          ref.read(itemCountProvider(i).notifier).state = 1;
                        }
                        showSuccessToast("All items in Cart is removed",
                            gravity: ToastGravity.CENTER);
                      } else {
                        showErrorToast("Cart is Empty",
                            gravity: ToastGravity.TOP);
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text("Cart is Empty")),
                        // );
                      }

                      // ref.watch(cartProvider.notifier).checkCartStatus();
                    },
                  ),
                  // if (itemCount > 0)
                  //   Positioned(
                  //     right: 8,
                  //     top: 8,
                  //     child: Container(
                  //       padding: const EdgeInsets.all(6),
                  //       decoration: const BoxDecoration(
                  //         color: Colors.red,
                  //         shape: BoxShape.circle,
                  //       ),
                  //       constraints: const BoxConstraints(
                  //         minWidth: 20,
                  //         minHeight: 20,
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           '$itemCount',
                  //           style: const TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 12,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ],
              );
            },
          ),
        ],
      ),
      // drawer: const DrawerWidget(),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? const Center(
                    child: Text("Your cart is empty"),
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final material = cartItems[index];
                      final itemCount = ref.watch(itemCountProvider(index));
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image section
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    ApiConstants.baseurl + material.thumbnail,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                        size: 100,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),

                                // Item details and actions
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Item name and delete icon
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              material.fullName,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              ref
                                                  .watch(cartProvider.notifier)
                                                  .removeFromCart(material);
                                              ref
                                                  .read(itemCountProvider(index)
                                                      .notifier)
                                                  .state = 1;
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 8),

                                      // Price per Kg
                                      Text(
                                        "Price: Rs. ${material.publicPurchasePrice} / per Kg",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87),
                                      ),
                                      const SizedBox(height: 8),

                                      // Price and quantity controls
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Total price
                                          Text(
                                            'Rs. ${material.publicPurchasePrice * itemCount}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          // Quantity control buttons
                                          Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon:
                                                      const Icon(Icons.remove),
                                                  onPressed: () async {
                                                    if (itemCount > 1) {
                                                      ref
                                                          .read(
                                                              itemCountProvider(
                                                                      index)
                                                                  .notifier)
                                                          .state--;
                                                      await _localDatabase
                                                          .updateItemCountInDb(
                                                              material
                                                                  .materialInfoID,
                                                              itemCount - 1);
                                                    }
                                                  },
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Text(
                                                    "$itemCount",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.add),
                                                  onPressed: () async {
                                                    ref
                                                        .read(itemCountProvider(
                                                                index)
                                                            .notifier)
                                                        .state++;
                                                    await _localDatabase
                                                        .updateItemCountInDb(
                                                            material
                                                                .materialInfoID,
                                                            itemCount + 1);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total cost text
                Text(
                  "Total Cost: Rs. ${totalCost.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                // Order now button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    if (cartItems.isNotEmpty) {
                      final orderDetails = createOrderDetails(ref);
                      print(orderDetails);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CustomerForm(details: orderDetails),
                        ),
                      );
                    } else {
                      showErrorToast(
                        "Add Items in Cart to proceed",
                        gravity: ToastGravity.CENTER,
                      );
                    }
                  },
                  child: const Text(
                    "Order Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<Detail> createOrderDetails(WidgetRef ref) {
  final cartItems = ref.watch(cartProvider);
  return cartItems.map((item) {
    final itemCount = ref.read(itemCountProvider(cartItems.indexOf(item)));
    return Detail(
      orderInfoDetailID: 0,
      orderInfoMasterID: 0,
      quantity: itemCount,
      measuringUnitID: item.smallestUnitID,
      materialInfoID: item.materialInfoID,
    );
  }).toList();
}
