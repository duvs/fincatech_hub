part of 'map_bloc.dart';

sealed class MapState extends Equatable {
  const MapState();
  
  @override
  List<Object> get props => [];
}

final class MapInitial extends MapState {
  @override
  List<Object> get props => [];
}

final class MapLoading extends MapState {
  @override
  List<Object> get props => [];
}

final class MapLoaded extends MapState {
  final Map<String, double> location;

  const MapLoaded(this.location);

  @override
  List<Object> get props => [location];
}

final class MapError extends MapState {
  final String error;

  const MapError(this.error);

  @override
  List<Object> get props => [error];
}