import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:diary/providers/entry_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Carousel extends ConsumerStatefulWidget {
  const Carousel({super.key});

  @override
  ConsumerState<Carousel> createState() => _CarouselState();
}

class _CarouselState extends ConsumerState<Carousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    List<String>? imgList = ref.watch(currentEntryProvider).imgPaths;

    if (imgList == null || imgList.isEmpty) {
      return const SizedBox.shrink();
    }

    if (imgList.length == 1) {
      return Image.file(
        File(imgList[0]),
        height: 300,
      );
    }
    var screenWidth = MediaQuery.sizeOf(context).width;

    if (screenWidth > 600) {
      return Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            items: imgList.map((imgPath) => Image.file(File(imgPath))).toList(),
            options: CarouselOptions(
              height: 300,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 6.0,
                  height: 6.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withAlpha(((_current == entry.key ? 0.9 : 0.4) * 255)
                            .round()),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      );
    } else {
      return CarouselSlider(
        items: imgList.map((imgPath) => Image.file(File(imgPath))).toList(),
        options: CarouselOptions(
          height: 300,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          viewportFraction: 0.7,
        ),
      );
    }
  }
}
