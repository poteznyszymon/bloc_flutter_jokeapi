// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'joke_bloc.dart';

@immutable
sealed class JokeState {}

abstract class JokeActionState extends JokeState {}

class JokeInitial extends JokeState {}

class JokeFetchingLoadingState extends JokeState {}

class JokeFetchingErrorState extends JokeState {}

class JokeFetchingSuccesfullState extends JokeState {
  final JokeModel joke;
  JokeFetchingSuccesfullState({
    required this.joke,
  });
}
