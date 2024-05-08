import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:joke_api/features/joke/models/joke.model.dart';
import 'package:joke_api/features/joke/repository/joke_repository.dart';
import 'package:meta/meta.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeInitial()) {
    on<JokeInitialFetchEvent>(jokeInitialFetchEvent);
  }

  FutureOr<void> jokeInitialFetchEvent(
      JokeInitialFetchEvent event, Emitter<JokeState> emit) async {
    emit(JokeFetchingLoadingState());
    JokeModel joke = await JokeRepository.fetchJoke();
    emit(JokeFetchingSuccesfullState(joke: joke));
  }
}
