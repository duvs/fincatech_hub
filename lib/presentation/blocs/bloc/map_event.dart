part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

final class MapStarted extends MapEvent {
  @override
  List<Object> get props => [];
}