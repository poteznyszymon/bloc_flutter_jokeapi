import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_api/features/joke/bloc/joke_bloc.dart';

class JokePage extends StatefulWidget {
  const JokePage({super.key});

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final JokeBloc jokeBloc = JokeBloc();

  @override
  void initState() {
    jokeBloc.add(JokeInitialFetchEvent());
    super.initState();
  }

  final headingStyle = const TextStyle(
      color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500);
  final style = const TextStyle(color: Colors.white, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: BlocConsumer<JokeBloc, JokeState>(
          bloc: jokeBloc,
          listenWhen: (previous, current) => current is JokeActionState,
          buildWhen: (previous, current) => current is! JokeActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case JokeFetchingLoadingState:
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey.shade300,
                  ),
                );
              case JokeFetchingSuccesfullState:
                final sucessState = state as JokeFetchingSuccesfullState;
                return Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sucessState.joke.type,
                              style: headingStyle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              sucessState.joke.setup,
                              style: style,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              sucessState.joke.punchline,
                              style: style,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment(0, 0.8),
                        child: Text(
                          'Click for next',
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey.shade500),
                        ),
                      )
                    ],
                  ),
                );

              default:
                return SizedBox();
            }
          },
        ),
      ),
      onTap: () {
        jokeBloc.add(
          JokeInitialFetchEvent(),
        );
      },
    );
  }
}
