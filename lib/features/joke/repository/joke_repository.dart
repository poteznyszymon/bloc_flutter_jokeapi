import 'package:joke_api/features/joke/models/joke.model.dart';
import 'package:http/http.dart' as http;

class JokeRepository {
  static Future<JokeModel> fetchJoke() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.https('official-joke-api.appspot.com', '/random_joke'),
      );
      JokeModel joke = JokeModel.fromJson(response.body);
      return joke;
    } catch (e) {
      return JokeModel(
          type: 'error', setup: 'error', punchline: 'error', id: 401);
    }
  }
}
