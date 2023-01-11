import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_epsiode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs; // Favorite: 1. 선언
  bool isLiked = false;

  Future initPrefs() async {
    prefs =
        await SharedPreferences.getInstance(); // Favorite: 3. 공유 공간 접근 권한 획득
    final likedToons = prefs.getStringList(
        "likedToons"); // Favorite: 4. "###"라는 Key를 가진 StringList 가져오기. 없으면 Null 반환
    if (likedToons != null) {
      // Favorite: 6. "key"의 저장요소가 존재한다면,
      if (likedToons.contains(widget.id)) {
        // Favorite: 7. 현재 화면의 widget.id를 확인하여 있으면
        setState(() {
          // Favorite: 9. Rebuild
          isLiked = true; // Favorite: 8. state 변경
        });
      }
    } else {
      prefs.setStringList('likedToons', []);
      // Favorite: 5. 없으면 빈 리스트를 생성하여 공유 저장공간에 저장.
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService().getToonById(widget.id);
    episodes = ApiService().getLatestEpsiodesById(widget.id);
    initPrefs(); // Favorite: 2. init Prefs
  }

  void onHeartTap() async {
    final likedToons = prefs.getStringList("likedToons");
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      setState(() {
        isLiked = !isLiked;
      });
      prefs.setStringList("likedToons", likedToons);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: isLiked
                ? const Icon(
                    Icons.favorite_rounded,
                  )
                : const Icon(
                    Icons.favorite_border_outlined,
                  ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.greenAccent.shade400,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(5, 10),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 150,
                      child: Image.network(widget.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: webtoon,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      var webtoon = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            webtoon.about,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${webtoon.age} / ${webtoon.genre}",
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Text("...");
                    }
                  })),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: episodes,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(
                            episode: episode,
                            webtoon_id: widget.id,
                          ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
