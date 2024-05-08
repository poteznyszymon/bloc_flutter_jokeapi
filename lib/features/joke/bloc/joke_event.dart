part of 'joke_bloc.dart';

@immutable
sealed class JokeEvent {}

class JokeInitialFetchEvent extends JokeEvent {}
