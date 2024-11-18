import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/widgets/toast.dart';
import 'package:tarkari_app/features/cart_screen/models/order_model.dart';
import 'package:tarkari_app/features/cart_screen/providers/cart_provider.dart';
import 'package:tarkari_app/features/cart_screen/views/customer_form_screen.dart';
import 'package:tarkari_app/features/home_screen/model/product_model.dart';

class ItemScreen extends HookConsumerWidget {
  const ItemScreen(this.material, this.category, {super.key});
  final Materials material;
  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCounter = useState(1);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Product Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  '${ApiConstants.baseurl}${material.thumbnail}',
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  material.fullName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                Text(
                  category,
                  style: const TextStyle(color: Colors.black87),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rs. ${material.publicPurchasePrice * itemCounter.value}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    _CounterButton(
                      icon: Icons.remove,
                      onPressed: () {
                        if (itemCounter.value > 1) {
                          itemCounter.value--;
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "${itemCounter.value}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _CounterButton(
                      icon: Icons.add,
                      onPressed: () {
                        if (itemCounter.value < 10) {
                          itemCounter.value++;
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Product Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.green.withOpacity(0.5),
                ),
              ),
              child: Text(
                "$category एक पौष्टिक तरकारी हो जसमा भिटामिन, खनिज, र फाइबर भरपूर मात्रामा पाइन्छ। यसले शरीरलाई आवश्यक ऊर्जा प्रदान गर्नुका साथै रोग प्रतिरोधात्मक क्षमता बढाउन मद्दत गर्छ। विभिन्न परिकारमा प्रयोग गर्न मिल्ने $category स्वास्थ्यको लागि लाभदायक छ।",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    final updatedMaterial = Materials(
                      materialInfoID: material.materialInfoID,
                      fullName: material.fullName,
                      code: material.code,
                      productSubCategoryID: material.productSubCategoryID,
                      smallestUnitID: material.smallestUnitID,
                      smallestUnitName: material.smallestUnitName,
                      status: material.status,
                      publicPurchasePrice: material.publicPurchasePrice,
                      thumbnail: material.thumbnail,
                      itemCount: itemCounter.value,
                    );
                    ref.read(cartProvider.notifier).addToCart(updatedMaterial);
                    showSuccessToast('${material.fullName} added to cart!',
                        gravity: ToastGravity.CENTER);
                  },
                  child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.shopping_cart),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      final orderDetails = Detail(
                        orderInfoDetailID: 0,
                        orderInfoMasterID: 0,
                        quantity: itemCounter.value,
                        measuringUnitID: material.smallestUnitID,
                        materialInfoID: material.materialInfoID,
                      );
                      List<Detail> orderDetailsList = [orderDetails];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CustomerForm(details: orderDetailsList)));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              width: 1.0,
                              color: Colors.green,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _CounterButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }
}
