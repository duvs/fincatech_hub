import 'package:fincatech_hub/domain/repositories/map_repository.dart';
import 'package:geolocator/geolocator.dart';


class MapRepositoryImpl extends MapRepository {
  @override
  Future<Map<String, double>> getCurrentLocation() async {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 10,
    );

    Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);

    return {'latitude': position.latitude, 'longitude': position.longitude};
  }
  
  @override
  Future<void> checkPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // El usuario denegó permanentemente el permiso.
      // openAppSettings(); O mostrar un mensaje
    }
  }
}