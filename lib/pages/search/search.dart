import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Constants/Colors/Colors.dart';
import 'package:netflix/pages/search/widgets/widgets.dart';

import '../../api/http_services.dart';
import '../../api/tmdb_api.dart';
import '../../constants/widgets/constant_widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool search = false;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: controller,
                onSubmitted: (value) {
                  setState(() {
                    search = true;
                  });
                },
                onSuffixTap: () {
                  setState(() {
                    search = false;
                    controller.clear();
                  });
                },
                backgroundColor: backgroundGrey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: backgroundGrey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: backgroundGrey,
                ),
                style: const TextStyle(
                  color: backgroundWhite,
                ),
              ),
              Expanded(
                // child: SearchList(),
                child: search == false
                    ? FutureBuilder(
                        future: HttpServices().getUpcoming(TMDB.upComing),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> list = snapshot.data;
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kVerticalSpace,
                                const SearchTitle(title: 'Top Searches'),
                                kVerticalSpace,
                                Expanded(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        SearchListTile(
                                      image: '${list[index].image}',
                                      title: '${list[index].title}',
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox.fromSize(
                                      size: const Size(0, 8),
                                    ),
                                    itemCount: list.length,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column();
                          }
                        },
                      )
                    : FutureBuilder(
                        future: HttpServices().getTrending(TMDB.searchItems),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> imageList = snapshot.data;
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kVerticalSpace,
                                const SearchTitle(title: 'Movies & TV'),
                                kVerticalSpace,
                                Expanded(
                                  child: GridView.count(
                                    crossAxisCount: 3,
                                    shrinkWrap: true,
                                    mainAxisSpacing: 7,
                                    crossAxisSpacing: 7,
                                    childAspectRatio: 1 / 1.5,
                                    children: List.generate(
                                      imageList.length,
                                      (index) {
                                        return SearchGridTile(
                                          image: '${imageList[index].image}',
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column();
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
