import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
