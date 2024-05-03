import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


class QiblaProvider with ChangeNotifier {
  double? direction;
  Position? locationData;
  bool isLoading = true;
  String error = '';
  bool shouldShowLocationDialog = false;

  QiblaProvider() {
    checkPermissionsAndStart();
  }

  Future<void> checkPermissionsAndStart() async {
    isLoading = true;
    notifyListeners();
    var permissionStatus = await Permission.locationWhenInUse.status;
    if (!permissionStatus.isGranted) {
      permissionStatus = await Permission.locationWhenInUse.request();
    }
    if (permissionStatus.isGranted) {
      initializeCompass();
      getLocation();
    } else {
      isLoading = false;
      error = 'Location permission not granted';
      notifyListeners();
    }
  }


  Future<void> getLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      shouldShowLocationDialog = true;
      isLoading = false;
      notifyListeners();
      return;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      isLoading = false;
      error = 'Location permissions are denied';
      notifyListeners();
      return;
    }

    locationData = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    isLoading = false;
    notifyListeners();
  }

  void initializeCompass() {
    FlutterCompass.events!.listen((CompassEvent event) {
      direction = event.heading;
      notifyListeners();
    }, onError: (e) {
      error = 'Compass error: $e';
      notifyListeners();
    });
  }

  double calculateQiblaDirection() {
    if (locationData == null) return 0;
    double phiK = 21.4 * pi / 180.0;
    double lambdaK = 39.8 * pi / 180.0;
    double phi = locationData!.latitude * pi / 180.0;
    double lambda = locationData!.longitude * pi / 180.0;
    double psi = 180.0 /
        pi *
        atan2(sin(lambdaK - lambda),
            cos(phi) * tan(phiK) - sin(phi) * cos(lambdaK - lambda));
    return psi.roundToDouble();
  }

}
