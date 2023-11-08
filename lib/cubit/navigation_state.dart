part of 'navigation_cubit.dart';

@immutable
class NavigationState extends Equatable {
  NavigationState(this.navbarItem, this.index);
  final NavbarItem navbarItem;
  final int index;
  @override
  List<Object> get props => [this.navbarItem, this.index];
}

class NavigationInitial extends NavigationState {
  NavigationInitial(super.navbarItem, super.index);
}
