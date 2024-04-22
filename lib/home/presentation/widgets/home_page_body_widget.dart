import 'package:flutter/material.dart';
import 'package:flutter_application_improves/home/presentation/widgets/cards_list_widget.dart';
import 'package:flutter_application_improves/home/presentation/widgets/tabs_widget.dart';

class HomePageBodyWidget extends StatefulWidget {
  const HomePageBodyWidget({super.key});

  @override
  State<HomePageBodyWidget> createState() => _HomePageBodyWidgetState();
}

class _HomePageBodyWidgetState extends State<HomePageBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: const Color.fromARGB(59, 176, 176, 176),
        child: Column(
          children: [
            TabsWidget(
              onCallBackTabValue: (String value) {
                ScaffoldMessenger.of(context).clearSnackBars();
                final snackBar = SnackBar(
                  content: Text(value),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            const CardsListWidget(),
          ],
        ),
      ),
    );
  }
}
