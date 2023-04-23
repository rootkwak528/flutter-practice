import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_detail.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl = "webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";
  static const String episode = "episodes";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.https(baseUrl, today);
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Error();
    }

    return jsonDecode(response.body)
        .map<WebtoonModel>((webtoonJson) => WebtoonModel.fromJson(webtoonJson))
        .toList();
  }

  static Future<WebtoonDetailModel> getDetailById(String id) async {
    final url = Uri.https(baseUrl, id);
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Error();
    }

    return WebtoonDetailModel.fromJson(jsonDecode(response.body));
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    final url = Uri.https(baseUrl, "$id/$episode");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Error();
    }

    return jsonDecode(response.body)
        .map<WebtoonEpisodeModel>(
            (episodeJson) => WebtoonEpisodeModel.fromJson(episodeJson))
        .toList();
  }
}
