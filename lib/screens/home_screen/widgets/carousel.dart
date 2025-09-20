import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<String>? imgList;

  const Carousel({super.key, required this.imgList});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    if (widget.imgList == null || widget.imgList!.isEmpty) {
      return const SizedBox.shrink();
    }

    if (widget.imgList!.length == 1) {
      return Image.file(
        File(widget.imgList![0]),
        height: 300,
      );
    }
    var screenWidth = MediaQuery.sizeOf(context).width;

    if (screenWidth > 600) {
      return Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            items: widget.imgList!
                .map((imgPath) => Image.file(File(imgPath)))
                .toList(),
            options: CarouselOptions(
                height: 300,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imgList!.asMap().entries.map((entry) {
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
        items: widget.imgList!
            .map((imgPath) => Image.file(File(imgPath)))
            .toList(),
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
