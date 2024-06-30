import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final double? lat;
  final double? long;

  const MapScreen({super.key, this.lat, this.long});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? currentLocation;
  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  LocationSettings? locationSettings;

  @override
  void initState() {
    super.initState();
    getUserCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: currentLocation!,
                zoom: 16,
              ),
              onMapCreated: (GoogleMapController controller) {
                googleMapController.complete(controller);
              },
            ),
    );
  }

  Future<void> getUserCurrentLocation() async {
    bool status = await checkPermissions();

    if (status) {
      await initLocationSettings();
      getPositionStream();
    }
  }

  Future<bool> checkPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled) {
      return true;
    }
    return false;
  }

  void getPositionStream() async {
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      print('state: ${position?.latitude}, ${position?.longitude}');
      setState(() {
        if (position != null) {
          currentLocation = LatLng(position.latitude, position.longitude);

          newCameraPosition(currentLocation);
        }
      });
    });
  }

  Future<void> newCameraPosition(LatLng? position) async {
    CameraPosition cameraPosition = CameraPosition(
      target: position!,
      zoom: 16,
    );
    final GoogleMapController controller = await googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<void> initLocationSettings() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 10),
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText:
                "Resq Me will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }
  }
}
