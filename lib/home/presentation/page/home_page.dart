import 'package:flutter/material.dart';
import 'package:flutter_application_improves/home/presentation/widgets/home_page_body_widget.dart';
import 'package:flutter_application_improves/home/presentation/widgets/home_page_header_widget.dart';

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
