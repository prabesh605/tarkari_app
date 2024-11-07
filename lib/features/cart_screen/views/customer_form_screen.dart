import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tarkari_app/core/models/response/response_status.dart';
import 'package:tarkari_app/features/cart_screen/models/order_model.dart';
import 'package:tarkari_app/features/cart_screen/providers/cart_provider.dart';
import 'package:tarkari_app/features/cart_screen/providers/order_provider.dart';
import 'package:tarkari_app/features/home/home.dart';
// import 'package:geolocator/geolocator.dart';

final selectedLocationProvider = StateProvider<LatLng?>((ref) => null);
final selectedMarkerProvider = StateProvider<Marker?>((ref) => null);
final formKey = GlobalKey<FormState>();
final cusName = TextEditingController();
final cusPhone = TextEditingController();
final cusEmail = TextEditingController();
final cusAdress = TextEditingController();

class CustomerForm extends HookConsumerWidget {
  final List<Detail> details;
  const CustomerForm({super.key, required this.details});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final location = ref.watch(locationProvider);

    // GoogleMapController? mapController;
    // LatLng? selectedLocation;
    final selectedLocation = ref.watch(selectedLocationProvider);
    final selectedMarker = ref.watch(selectedMarkerProvider);
    final orderService = ref.read(orderProvider.notifier);

    String? latitude;
    String? longitude;
    ref.listen<ResponseStatus>(orderProvider, (previous, next) {
      ref.read(cartProvider.notifier).clearCart();
      if (next is ResponseStatusSuccess) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Order Success"),
            content: const Text("Your order has been placed successfully!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else if (next is ResponseStatusError) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Order Failed"),
            content: const Text("Order Failed Please try again"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    });
    Future<void> _selectCurrentLocation(
        WidgetRef ref, BuildContext context) async {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location services are disabled.")),
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Location permissions are denied")),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Location permissions are permanently denied")),
        );
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      LatLng currentLocation = LatLng(position.latitude, position.longitude);
      ref.read(selectedLocationProvider.notifier).state = currentLocation;
      ref.read(selectedMarkerProvider.notifier).state = Marker(
        markerId: const MarkerId('current_location'),
        position: currentLocation,
        infoWindow: const InfoWindow(title: "Current Location"),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        ref.read(selectedLocationProvider.notifier).state = null;
        ref.read(selectedMarkerProvider.notifier).state = null;
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Customer Details'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Please fill the form to Continue...",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    controller: cusName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(width: 0.5),
                        ),
                        fillColor: const Color(0xffA6E079).withOpacity(0.2),
                        filled: true,
                        labelText: 'Full Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your full name' : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cusPhone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(width: 0.5),
                        ),
                        fillColor: const Color(0xffA6E079).withOpacity(0.2),
                        filled: true,
                        labelText: 'Mobile Number'),
                    validator: (value) => value!.isEmpty
                        ? 'Please enter your mobile number'
                        : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cusEmail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(width: 0.5),
                        ),
                        fillColor: const Color(0xffA6E079).withOpacity(0.2),
                        filled: true,
                        labelText: 'Email Address'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cusAdress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(width: 0.5),
                        ),
                        fillColor: const Color(0xffA6E079).withOpacity(0.2),
                        filled: true,
                        labelText: 'Address'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your address' : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Select Location on Map",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        GoogleMap(
                          onMapCreated: (GoogleMapController controller) {},
                          onTap: (LatLng position) {
                            ref.read(selectedLocationProvider.notifier).state =
                                position;
                            ref.read(selectedMarkerProvider.notifier).state =
                                Marker(
                              markerId: const MarkerId('selected_location'),
                              position: position,
                              infoWindow:
                                  const InfoWindow(title: "Selected Location"),
                            );
                            latitude = "${position.latitude}";
                            longitude = "${position.longitude}";
                          },
                          initialCameraPosition: const CameraPosition(
                            target: LatLng(27.7172, 85.3240),
                            zoom: 10,
                          ),
                          markers:
                              selectedMarker != null ? {selectedMarker!} : {},
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: ElevatedButton(
                            onPressed: () =>
                                _selectCurrentLocation(ref, context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Select Current Location",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.red),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (selectedLocation != null) {
                            final orderDetails = Mast(
                              fullname: cusName.text,
                              mobileNo: cusPhone.text,
                              address: cusAdress.text,
                              email: cusEmail.text,
                              lat: selectedLocation.latitude.toString(),
                              lon: selectedLocation.longitude.toString(),
                              details: details,
                            );
                            final customerOrder =
                                CustomerOrder(mast: orderDetails);
                            orderService.getOrderItems(customerOrder);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please select a location")),
                            );
                          }
                        }
                      },
                      child: const Text(
                        "Proceed",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
