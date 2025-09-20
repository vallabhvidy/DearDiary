import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<String>? imgList;

  const Carousel({super.key, required this.imgList});

  @override
  Widget build(BuildContext context) {
    if (imgList == null || imgList!.isEmpty) {
      return const SizedBox.shrink();
    }

    if (imgList!.length == 1) {
      return Image.file(
        File(imgList![0]),
        height: 300,
      );
    }

    return CarouselSlider(
      items: imgList!.map((imgPath) => Image.file(File(imgPath))).toList(),
      options: CarouselOptions(
        height: 300,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        viewportFraction: 0.7,
      ),
    );
  }
}
