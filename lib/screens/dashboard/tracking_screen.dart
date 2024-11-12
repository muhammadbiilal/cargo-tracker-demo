import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final LatLng _initialPosition = const LatLng(37.7749, -122.4194);
  final bool _isDoorOpen = true;
  final bool _isOffRoute = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          // SOS Button
          Positioned(
            top: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement SOS functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
              child: const Text('SOS'),
            ),
          ),
          // Alerts Panel
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alerts',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (_isOffRoute)
                      const ListTile(
                        leading: Icon(Icons.warning, color: Colors.orange),
                        title: Text('Off-Route'),
                        dense: true,
                      ),
                    if (_isDoorOpen)
                      const ListTile(
                        leading: Icon(Icons.door_back_door, color: Colors.red),
                        title: Text('Door Open'),
                        dense: true,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
