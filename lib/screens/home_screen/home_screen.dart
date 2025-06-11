import 'package:diary/screens/home_screen/widgets/date_switcher.dart';
import 'package:diary/screens/home_screen/widgets/home_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DateSwitcher(),
        centerTitle: true,
      ),
      body: HomeContainer(),
    );
  }
}
