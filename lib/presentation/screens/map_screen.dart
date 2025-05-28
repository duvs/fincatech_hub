import 'package:fincatech_hub/domain/use_cases/map_use_case.dart';
import 'package:fincatech_hub/infrastructure/repositories/map_repository_impl.dart';
import 'package:fincatech_hub/presentation/blocs/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MapRepositoryImpl mapRepository = MapRepositoryImpl();
    final MapUseCase mapUseCase = MapUseCase(mapRepository);

    return BlocProvider<MapBloc>(
      create: (_) => MapBloc(mapUseCase),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Google Maps')),
            body: BlocBuilder<MapBloc, MapState>(
              builder: (context, state) {
                if (state is MapLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MapLoaded) {
                  final location = state.location;
                  final latitude = location['latitude']!;
                  final longitude = location['longitude']!;

                  return GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(latitude, longitude),
                      zoom: 14,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('current_location'),
                        position: LatLng(latitude, longitude),
                      ),
                    },
                  );
                } else if (state is MapError) {
                  return Center(child: Text(state.error));
                }
                return const SizedBox();
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<MapBloc>().add(MapStarted());
              },
              child: const Icon(Icons.location_on),
            ),
          );
        },
      ),
    );
  }
}
