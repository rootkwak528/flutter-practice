import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon/models/webtoon_detail.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';
import 'package:webtoon/widgets/episode.dart';

class DetailScreen extends StatefulWidget {
  final WebtoonModel webtoon;

  const DetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Future<WebtoonDetailModel> webtoonDetail;
  late final Future<List<WebtoonEpisodeModel>> webtoonEpisodes;
  late final SharedPreferences prefs;
  bool isLiked = false;

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isLiked = prefs.getBool(widget.webtoon.id) ?? false;
    });
  }

  @override
  void initState() {
    webtoonDetail = ApiService.getDetailById(widget.webtoon.id);
    webtoonEpisodes = ApiService.getLatestEpisodesById(widget.webtoon.id);
    initPrefs();
    super.initState();
  }

  heartTap() async {
    setState(() {
      isLiked = !isLiked;
    });
    await prefs.setBool(widget.webtoon.id, isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Hero(
          tag: "${widget.webtoon.id}-title",
          child: Text(
            widget.webtoon.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: heartTap,
            icon: isLiked
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 50,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${widget.webtoon.id}-thumb",
                    child: Container(
                      height: 200,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 1,
                          )
                        ],
                      ),
                      child: Image.network(
                        widget.webtoon.thumb,
                        headers: const {
                          "User-Agent":
                              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: webtoonDetail,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading..");
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data!.age} / ${snapshot.data!.genre}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: webtoonEpisodes,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("");
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      print(index);
                      return Episode(
                        webtoon: widget.webtoon,
                        webtoonEpisode: snapshot.data![index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: snapshot.data!.length,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
