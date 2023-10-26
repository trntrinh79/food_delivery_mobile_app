part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class TabChange extends HomeEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}

class HomeProductFavoriteButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeFavoriteButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
