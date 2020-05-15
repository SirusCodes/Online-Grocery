import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';

class LocationHandler {
  PermissionStatus _permissionStatus;

  bool get getPermStatus {
    return PermissionStatus.granted == _permissionStatus ? true : false;
  }

  requestLocationPerm() async {
    _permissionStatus = await LocationPermissions().requestPermissions();
  }

  Future<String> getLastLocationAdd() async {
    if (getPermStatus) {
      Position position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await Geolocator().placemarkFromPosition(position);

      return placemarks.first.postalCode;
    } else if (_permissionStatus == PermissionStatus.denied) {
      return "Click to get your location";
    }
    return "Waiting for Location⌚";
  }
}
