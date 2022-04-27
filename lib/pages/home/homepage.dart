import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/pages/home/widgets/background_image_card.dart';
import 'package:netflix/pages/home/widgets/play_icon_images.dart';
import 'package:netflix/pages/home/widgets/title.dart';


import '../../api/http_services.dart';
import '../../api/tmdb_api.dart';
import '../../categories/categories.dart';
import '../../constants/colors/colors.dart';
import '../../constants/widgets/constant_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, bool index, _) {
          return Padding(
            padding: const EdgeInsets.all(6),
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      FutureBuilder(
                        future: HttpServices().getTrending(TMDB.trending),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return BackgroundImageCard(
                              image: snapshot.data[4].image,
                            );
                          } else {
                            return const SizedBox(
                              width: double.infinity,
                              height: 500,
                              
                                child:  SizedBox(
                                  width: double.infinity,
                                  height: 500,
                                ),
                            );
                          }
                        },
                      ),
                      kVerticalSpace,
                      const CardTitle(
                        title: 'Continue Watching for Iron Man',
                      ),
                      FutureBuilder(
                        future: HttpServices().getTrending(TMDB.searchTV),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> list = snapshot.data;
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => PlayIconCard(
                                  imageURL: '${list[index].image}',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    const CommonIconCards(
                                  imageURL: '',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          }
                        },
                      ),
                      kVerticalSpace,
                      const CardTitle(
                        title: 'Popular on Netflix',
                      ),
                      FutureBuilder(
                        future: HttpServices().getTrending(TMDB.popular),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> list = snapshot.data;
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    CommonIconCards(
                                  imageURL: '${list[index].image}',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    const CommonIconCards(
                                  imageURL: '',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          }
                        },
                      ),
                      kVerticalSpace,
                      const CardTitle(
                        title: 'Trending Now',
                      ),
                      FutureBuilder(
                        future: HttpServices().getTrending(TMDB.trending),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> list = snapshot.data;
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    CommonIconCards(
                                  imageURL: '${list[index].image}',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    const CommonIconCards(
                                  imageURL: '',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          }
                        },
                      ),
                      kVerticalSpace,
                      const CardTitle(
                        title: 'TV Shows Based on Books',
                      ),
                      FutureBuilder(
                        future: HttpServices().getTrending(TMDB.tvBasedOnBooks),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> list = snapshot.data;
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    CommonIconCards(
                                  imageURL: '${list[index].image}',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    const CommonIconCards(
                                  imageURL: '',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          }
                        },
                      ),
                      kVerticalSpace,
                      const CardTitle(
                        title: 'TV Dramas',
                      ),
                      FutureBuilder(
                        future: HttpServices().getTrending(TMDB.tvShows),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> list = snapshot.data;
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    CommonIconCards(
                                  imageURL: '${list[index].image}',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    const CommonIconCards(
                                  imageURL: '',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          }
                        },
                      ),
                      kVerticalSpace,
                      const CardTitle(
                        title: 'Top 10 in India Today',
                      ),
                      FutureBuilder(
                        future: HttpServices().getTrending(TMDB.top10),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> list = snapshot.data;
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  10,
                                  (index) => NumberCard(
                                    index: index + 1,
                                    image: '${list[index].image}',
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  list.length,
                                  (index) => NumberCard(
                                    index: index + 1,
                                    image: '${list[index].image}',
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      kVerticalSpace,
                      const CardTitle(
                        title: 'US Movies',
                      ),
                      FutureBuilder(
                        future: HttpServices().getTrending(TMDB.searchItems),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> list = snapshot.data;
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    CommonIconCards(
                                  imageURL: '${list[index].image}',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    CommonIconCards(
                                  imageURL: '${list[index].image}',
                                ),
                                separatorBuilder: (context, index) =>
                                    SizedBox.fromSize(
                                  size: const Size(6, 0),
                                ),
                                itemCount: list.length,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  scrollNotifier.value
                      ? AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.bounceIn,
                          width: double.infinity,
                          height: 130,
                          color: backgroundBlack.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/netflix-logo.png',
                                    width: 50,
                                    height: 100,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.cast,
                                        size: 25,
                                        color: backgroundWhite,
                                      ),
                                      Image.asset(
                                        'assets/images/ironman-avatar.png',
                                        height: 40,
                                        width: 40,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              isChanged == false
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text('TV Shows'),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isChanged = true;
                                            });
                                          },
                                          child: const Text('Movies'),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CategoriesPage(
                                                  isCategory: true,
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            children: const [
                                              Text('Categories'),
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: backgroundWhite,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        kHorizontalSpace,
                                        Row(
                                          children: const [
                                            Text(
                                              'Movies',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: backgroundWhite,
                                            ),
                                          ],
                                        ),
                                        kHorizontalSpace,
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CategoriesPage(
                                                  isCategory: false,
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            children: const [
                                              Text(
                                                'All Categories',
                                              ),
                                              Icon(
                                                Icons.arrow_drop_down_sharp,
                                                color: backgroundWhite,
                                              )
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                            ],
                          ),
                        )
                      : kVerticalSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
