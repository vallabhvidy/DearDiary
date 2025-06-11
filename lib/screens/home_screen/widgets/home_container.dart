import 'package:diary/screens/home_screen/widgets/text_area.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(36.0),
      height: double.infinity,
      child: TextArea(),
    );
  }
}
