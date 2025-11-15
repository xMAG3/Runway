import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runway/model/category_model.dart';
import 'package:runway/pages/categories_page.dart';
import 'package:runway/widgets/bottom_navigation_bar.dart';

import 'package:runway/widgets/custom_appbar.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;

  List<CategoryModel> category = [
    CategoryModel(image: "assets/images/categories/Women.png", name: 'Women'),
    CategoryModel(image: "assets/images/categories/Men.png", name: 'Men'),
    CategoryModel(image: "assets/images/categories/Kids.png", name: 'Kids'),
    CategoryModel(image: "assets/images/categories/Deals.png", name: 'Deals'),
    CategoryModel(image: "assets/images/categories/Women.png", name: 'Home'),
  ];

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/video/clothes.mp4')
      ..initialize().then((_) {
        {
          setState(() {
            _controller.play();
          });
        }
      })
      ..setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: 'Runway',
        prefix: "assets/svgs/bar-chart-2.svg",
        suffix: 'assets/svgs/Group.svg',
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            ///video
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.60,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),

            ///categories
            Positioned(
              bottom: 60,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Gap(30),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(category.length, (index) {
                          final item = category[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) => CategoriesPage(),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(item.image, width: 75),
                                  Gap(10),
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CustomBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
