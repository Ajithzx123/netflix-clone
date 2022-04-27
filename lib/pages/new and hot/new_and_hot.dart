import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/pages/new%20and%20hot/widgets/top_ten_widgets.dart';

import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';
import 'package:intl/intl.dart';

import '../../api/http_services.dart';
import '../../api/tmdb_api.dart';
import '../../constants/colors/colors.dart';
import '../../constants/widgets/constant_widgets.dart';
import 'widgets/coming_soon_widgets.dart';
import 'widgets/everyones_watching_widget.dart';

class NewAndHotPage extends StatelessWidget {
  const NewAndHotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            kHorizontalSpace,
            Text(
              'New & Hot',
              style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
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
      ),
      body: ScrollableListTabView(
        tabs: [
          ScrollableListTab(
            tab: ListTab(
              activeBackgroundColor: backgroundWhite,
              inactiveBackgroundColor: backgroundBlack,
              borderRadius: BorderRadius.circular(30),
              label: '🍿 Coming Soon',
            ),
            body: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: FutureBuilder(
                    future: HttpServices().getUpcoming(TMDB.upComing),
                    builder: (context, AsyncSnapshot snapshot) {
                      List<dynamic> list = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: ((context, index) {
                            return ComingSoonWidgets(
                              width: width,
                              movieName: '${list[index].title}',
                              movieDescription: '${list[index].overview}',
                              date: DateFormat('MMM')
                                  .format(
                                    DateTime.parse(
                                      '${list[index].date}',
                                    ),
                                  )
                                  .toUpperCase(),
                              imageURL: '${list[index].image}',
                              day: DateFormat('dd').format(
                                DateTime.parse('${list[index].date}'),
                              ),
                              comingSoonDate:
                                  'Coming On ${DateFormat('MMMM dd').format(
                                DateTime.parse('${list[index].date}'),
                              )}',
                            );
                          }),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          ScrollableListTab(
            tab: ListTab(
              activeBackgroundColor: backgroundWhite,
              inactiveBackgroundColor: backgroundBlack,
              borderRadius: BorderRadius.circular(30),
              label: '🔥 Everyone\'s watching',
            ),
            body: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: FutureBuilder(
                    future: HttpServices().getUpcoming(TMDB.popular),
                    builder: (context, AsyncSnapshot snapshot) {
                      List<dynamic> list = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return EveryonesWatchingWidget(
                              imageURL: '${list[index].image}',
                              movieDescription: '${list[index].overview}',
                              movieTitle: '${list[index].title}',
                            );
                          },
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          ScrollableListTab(
            tab: ListTab(
              activeBackgroundColor: backgroundWhite,
              inactiveBackgroundColor: backgroundBlack,
              borderRadius: BorderRadius.circular(30),
              label: '🔟 Top 10',
            ),
            body: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: FutureBuilder(
                    future: HttpServices().getUpcoming(TMDB.top10),
                    builder: ((context, AsyncSnapshot snapshot) {
                      List<dynamic> list = snapshot.data;
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return TopTenWidgets(
                              width: width,
                              imageURL: '${list[index].image}',
                              movieName: '${list[index].title}',
                              movieDescription: '${list[index].overview}',
                              number: index == 9
                                  ? '${index + 1}'
                                  : '0 ${index + 1}',
                            );
                          }),
                        );
                      } else {
                        return Container();
                      }
                    }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

