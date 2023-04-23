import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_detail.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';

class DetailScreen2 extends StatefulWidget {
  final WebtoonModel webtoon;

  const DetailScreen2({
    super.key,
    required this.webtoon,
  });

  @override
  State<DetailScreen2> createState() => _DetailScreen2State();
}

class _DetailScreen2State extends State<DetailScreen2> {
  late final Future<WebtoonDetailModel> webtoonDetail;
  late final Future<List<WebtoonEpisodeModel>> webtoonEpisodes;

  @override
  void initState() {
    webtoonDetail = ApiService.getDetailById(widget.webtoon.id);
    webtoonEpisodes = ApiService.getLatestEpisodesById(widget.webtoon.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 50,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              widget.webtoon.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
          ),
        ),
        FutureBuilder(
          future: webtoonEpisodes,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text("");
            }

            return SliverFixedExtentList(
              itemExtent: 50,
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  print(index);
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightGreen,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Text(
                          snapshot.data![index].title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
    // ],
  }
}
