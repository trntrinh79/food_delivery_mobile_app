import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial(0)) {
    on<HomeEvent>((event, emit) {
      if (event is TabChange) {
        print(event.tabIndex);
        emit(HomeInitial(event.tabIndex));
      }
    });
  }
}
