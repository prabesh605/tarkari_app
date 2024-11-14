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
    final itemcounter = useState(1);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 240, 223),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 240, 223),
        title: const Text("Product Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: .5),
            ),
            alignment: Alignment.center,
            height: 260,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  ApiConstants.baseurl + material.thumbnail,
                  // height: 200,
                  fit: BoxFit.cover,
                ),
                // child: Image.asset('assets/images/sample.jpg'),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      material.fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Text(
                      category,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            "Rs. ${material.publicPurchasePrice * itemcounter.value}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.4)),
                              ),
                              child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    if (itemcounter.value > 1) {
                                      itemcounter.value--;
                                    }
                                  }),
                            ),
                            Container(
                              width: 50,
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "${itemcounter.value}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.4)),
                              ),
                              child: IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  if (itemcounter.value < 10) {
                                    itemcounter.value++;
                                  }
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Product Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      // height: 300,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.5),
                        border: Border.all(
                          color: Colors.green.withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "$category एक पौष्टिक तरकारी हो जसमा भिटामिन, खनिज, र फाइबर भरपूर मात्रामा पाइन्छ। यसले शरीरलाई आवश्यक ऊर्जा प्रदान गर्नुका साथै रोग प्रतिरोधात्मक क्षमता बढाउन मद्दत गर्छ। विभिन्न परिकारमा प्रयोग गर्न मिल्ने $category स्वास्थ्यको लागि लाभदायक छ।",
                        style: const TextStyle(fontSize: 14),
                        softWrap: true,
                      ),
                    )
                    // const Text("Lorem ipsum dolor sit amet,",
                    //     style: TextStyle(fontSize: 14), maxLines: 4),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
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
                      itemCount: itemcounter.value,
                    );
                    ref.read(cartProvider.notifier).addToCart(updatedMaterial);
                    showSuccessToast('${material.fullName} added to cart!',
                        gravity: ToastGravity.TOP);
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
                        quantity: itemcounter.value,
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
            ),
          )
        ],
      ),
    );
  }
}
