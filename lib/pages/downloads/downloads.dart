import 'package:flutter/material.dart';
import 'package:netflix/Constants/Colors/Colors.dart';
import 'package:netflix/pages/downloads/widgets/widgets.dart';


import '../../api/http_services.dart';
import '../../api/tmdb_api.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../../constants/widgets/constant_widgets.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: SafeArea(
          child: CustomAppBarNewAndDownloads(
            title: 'Downloads',
          ),
        ),
      ),
      body: ListView(
        children: [
          kVerticalSpace,
          Row(
            children: const [
              kHorizontalSpace,
              Icon(
                Icons.settings_outlined,
                color: backgroundWhite,
              ),
              kHorizontalSpace,
              Text(
                'Smart Downloads',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Introducing Downloads for You',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          kVerticalSpace,
          const Text(
            'We\'ll download a personalized selection of movies and shows for you, so there\'s always something to watch on your device',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: backgroundGrey,
            ),
          ),
          FutureBuilder(
            future: HttpServices().getTrending(TMDB.trending),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: const EdgeInsets.only(bottom: 40),
                  width: size.width,
                  height: size.height * 0.4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.33,
                        backgroundColor: backgroundGrey.withOpacity(0.5),
                      ),
                      NetworkImagesWidget(
                        images: snapshot.data[0].image,
                        margin: const EdgeInsets.only(
                          left: 140,
                          bottom: 0,
                          top: 30,
                        ),
                        angle: 25,
                        size: Size(size.width * 0.3, size.width * 0.45),
                      ),
                      NetworkImagesWidget(
                        images: snapshot.data[1].image,
                        margin: const EdgeInsets.only(
                          right: 140,
                          bottom: 0,
                          top: 30,
                        ),
                        angle: -25,
                        size: Size(size.width * 0.3, size.width * 0.45),
                      ),
                      NetworkImagesWidget(
                        images: snapshot.data[2].image,
                        margin: const EdgeInsets.only(top: 12),
                        size: Size(size.width * 0.35, size.width * 0.55),
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox(
                  width: size.width,
                  height: size.height * 0.4,
                 
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.4,
                    ),
                  
                );
                
              }
            },
          ),
          ElevatedButtonSetUP(
            onpressed: () {},
          ),
          const ElevatedButtonDownload(),
        ],
      ),
    );
  }
}
