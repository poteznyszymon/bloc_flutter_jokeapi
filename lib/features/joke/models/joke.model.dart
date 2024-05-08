// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JokeModel {
  final String type;
  final String setup;
  final String punchline;
  final int id;

  JokeModel({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'setup': setup,
      'punchline': punchline,
      'id': id,
    };
  }

  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      type: map['type'] as String,
      setup: map['setup'] as String,
      punchline: map['punchline'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory JokeModel.fromJson(String source) => JokeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
