import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String moviedbApiKey =
      dotenv.env['MOVIEDB_API_KEY'] ?? 'No API Key found';
}
