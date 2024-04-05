import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Column(
        children: [
          HomePageHeaderWidget(),
          HomePageBodyWidget(),
        ],
      ),
    );
  }
}

class HomePageHeaderWidget extends StatelessWidget {
  const HomePageHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class HomePageBodyWidget extends StatelessWidget {
  const HomePageBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
