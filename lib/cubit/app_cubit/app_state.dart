part of 'app_cubit.dart';

@immutable
abstract class AppState extends Equatable {}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AppState {
  final List<ProductDataModel> places;
  LoadedState(this.places);

  @override
  List<Object> get props => [places];
}

class DetailState extends AppState {
  final ProductDataModel place;
  DetailState(this.place);
  @override
  List<Object> get props => [place];
}
