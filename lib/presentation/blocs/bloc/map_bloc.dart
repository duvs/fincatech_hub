import 'package:fincatech_hub/domain/use_cases/map_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapUseCase mapUseCase;

  MapBloc(this.mapUseCase) : super(MapInitial()) {
    on<MapStarted>(_onStarted);
  }

  Future<void> _onStarted(MapStarted event, Emitter<MapState> emit) async {
    emit(MapLoading());
    try {
      await mapUseCase.checkPermissions();
      final Map<String, double> location = await mapUseCase.getCurrentLocation();
      emit(MapLoaded(location));
    } catch (e) {
      emit(MapError('Error loading location: $e'));
    }
  }
}
