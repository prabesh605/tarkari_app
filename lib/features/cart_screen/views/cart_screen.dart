import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/widgets/drawer.dart';
import 'package:tarkari_app/features/cart_screen/models/order_model.dart';
import 'package:tarkari_app/features/cart_screen/providers/cart_provider.dart';
import 'package:tarkari_app/features/cart_screen/views/customer_form_screen.dart';

final itemCountProvider = StateProvider.family<int, int>((ref, index) => 1);

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
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      // ref.watch(cartProvider.notifier).checkCartStatus();
                    },
                  ),
                  if (itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Center(
                          child: Text(
                            '$itemCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
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
                ? const Center(child: Text("Your cart is empty"))
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final material = cartItems[index];
                      final itemCount = ref.watch(itemCountProvider(index));
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  ref
                                      .watch(cartProvider.notifier)
                                      .removeFromCart(material);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      ApiConstants.baseurl + material.thumbnail,
                                      height: 100),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price: ${material.publicPurchasePrice * itemCount}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          iconSize: 20,
                                          onPressed: () {
                                            ref
                                                .read(itemCountProvider(index)
                                                    .notifier)
                                                .state++;
                                          },
                                          icon: const Icon(Icons.add),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(0.4)),
                                            ),
                                            child: Text(
                                              "$itemCount",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )),
                                        IconButton(
                                            icon: const Icon(Icons.remove),
                                            onPressed: () {
                                              if (itemCount > 1) {
                                                ref
                                                    .read(
                                                        itemCountProvider(index)
                                                            .notifier)
                                                    .state--;
                                              }
                                            }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                // color: Colors.green.withOpacity(0.5),
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Cost :${totalCost.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        backgroundColor: Colors.red),
                    onPressed: () {
                      if (cartItems.isNotEmpty) {
                        final orderDetails = createOrderDetails(ref);
                        print(orderDetails);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CustomerForm(details: orderDetails)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Add Items in Cart to procceed")),
                        );
                      }
                    },
                    child: const Text(
                      "Oder Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ))
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
      quantity: itemCount,
      materialInfoID: item.materialInfoID,
    );
  }).toList();
}
