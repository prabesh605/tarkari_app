// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatefulWidget {
//   final Function(LatLng) onLocationSelected;

//   const MapScreen({Key? key, required this.onLocationSelected})
//       : super(key: key);

//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;
//   LatLng? selectedPosition;
//   Marker? selectedMarker;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Select Location"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.check),
//             onPressed: () {
//               try {
//                 if (selectedPosition != null) {
//                   Navigator.pop( context);
//                   widget.onLocationSelected(selectedPosition!);
                  
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                         content: Text("Please select a location on the map")),
//                   );
//                 }
//               } catch (e) {
//                 print(e.toString());
//               }
//             },
//           ),
//         ],
//       ),
//       body: GoogleMap(
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//         onTap: (LatLng position) {
//           setState(() {
//             selectedPosition = position;
//             selectedMarker = Marker(
//               markerId: const MarkerId('selected_location'),
//               position: position,
//               infoWindow: const InfoWindow(title: "Selected Location"),
//             );
//           });
//         },
//         initialCameraPosition: const CameraPosition(
//           target: LatLng(27.7172, 85.324), // Set to a default location
//           zoom: 10,
//         ),
//         markers: selectedMarker != null ? {selectedMarker!} : {},
//       ),
//     );
//   }
// }
