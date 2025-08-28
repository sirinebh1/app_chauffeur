import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailMissionScreen extends StatefulWidget {
  const DetailMissionScreen({super.key});

  @override
  State<DetailMissionScreen> createState() => _DetailMissionScreenState();
}

class _DetailMissionScreenState extends State<DetailMissionScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  final LatLng _startPoint = const LatLng(35.7333, 10.5833);
  final LatLng _endPoint = const LatLng(35.7667, 10.8167);

  late final Set<Marker> _markers;
  late final Set<Polyline> _polylines;

  @override
  void initState() {
    super.initState();

    _markers = {
      Marker(
        markerId: const MarkerId("start"),
        position: _startPoint,
        infoWindow: const InfoWindow(title: "Départ: Sahline"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
      Marker(
        markerId: const MarkerId("end"),
        position: _endPoint,
        infoWindow: const InfoWindow(title: "Arrivée: Z.I M. Harb"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    };

    _polylines = {
      Polyline(
        polylineId: const PolylineId("route"),
        color: Colors.indigo,
        width: 5,
        points: [
          _startPoint,
          const LatLng(35.74, 10.62),
          const LatLng(35.75, 10.70),
          _endPoint,
        ],
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _startPoint,
                zoom: 11,
              ),
              markers: _markers,
              polylines: _polylines,
              onMapCreated: (GoogleMapController controller) {
                if (!_controller.isCompleted) {
                  _controller.complete(controller);
                }
              },
              myLocationButtonEnabled: false,
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 6),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("ID : T49", style: TextStyle(fontWeight: FontWeight.bold)),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Départ: Sahline", style: TextStyle(color: Colors.black87)),
                        Text("À: 05:45"),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Arrivée: Z.I M. Harb", style: TextStyle(color: Colors.black87)),
                        Text("À: 06:30"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                    child:
                        ElevatedButton.icon(
                          onPressed: () {},
                          label: const Text("Signaler panne"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
    ),
                        Expanded(
                       child: ElevatedButton.icon(
                          onPressed: () {},

                          label: const Text("Démarrer"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo.shade400,

                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ],
                ),


                ),
              ),

          ],
        ),
      ),
    );
  }
}
