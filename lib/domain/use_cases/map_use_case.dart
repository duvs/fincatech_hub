import 'package:fincatech_hub/domain/repositories/map_repository.dart';

class MapUseCase {
  final MapRepository mapRepository;

  MapUseCase(this.mapRepository);

  Future<Map<String, double>> getCurrentLocation() async {
    try {
      final Map<String, double> location = await mapRepository.getCurrentLocation();
      return location;
    } catch (e) {
      throw Exception('Error fetching location: $e');
    }
  }

  Future<void> checkPermissions() async {
    try {
      await mapRepository.checkPermissions();
    } catch (e) {
      throw Exception('Error checking permissions: $e');
    }
  }
}