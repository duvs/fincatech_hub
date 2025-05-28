abstract class MapRepository {
  Future<Map<String, double>> getCurrentLocation();
  Future<void> checkPermissions();
}