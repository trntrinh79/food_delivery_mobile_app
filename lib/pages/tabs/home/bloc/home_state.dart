part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final int tabIndex;

  const HomeState(this.tabIndex);
}

abstract class HomeActionState extends HomeState {
  const HomeActionState(super.tabIndex);
}

class HomeInitial extends HomeState {
  const HomeInitial(super.tabIndex);
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState(super.tabIndex);
}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  const HomeLoadedSuccessState(super.tabIndex, this.products);
}

class HomeErrorState extends HomeState {
  const HomeErrorState(super.tabIndex);
}

class HomeNavigatetoFavoritePageActionState extends HomeActionState {
  const HomeNavigatetoFavoritePageActionState(super.tabIndex);
}

class HomeNavigatetoCartPageActionState extends HomeActionState {
  const HomeNavigatetoCartPageActionState(super.tabIndex);
}
