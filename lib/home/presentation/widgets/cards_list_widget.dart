import 'package:flutter/material.dart';
import 'package:flutter_application_improves/home/presentation/widgets/character_card_widget.dart';

class CardsListWidget extends StatelessWidget {
  const CardsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CharacterCardItem> mockItemList = [
      CharacterCardItem(
          imageUrl:
              'https://seeklogo.com/images/S/spiderman-face-logo-CEAE664BB1-seeklogo.com.png',
          description: 'Description 1',
          comicsAmmount: '25'),
      CharacterCardItem(
          imageUrl:
              'https://seeklogo.com/images/S/spiderman-face-logo-CEAE664BB1-seeklogo.com.png',
          description: 'Description 2',
          comicsAmmount: '32'),
      CharacterCardItem(
          imageUrl:
              'https://seeklogo.com/images/S/spiderman-face-logo-CEAE664BB1-seeklogo.com.png',
          description: 'Description 3',
          comicsAmmount: '55'),
      CharacterCardItem(
          imageUrl:
              'https://seeklogo.com/images/S/spiderman-face-logo-CEAE664BB1-seeklogo.com.png',
          description: 'Description 4',
          comicsAmmount: '328'),
      CharacterCardItem(
          imageUrl:
              'https://seeklogo.com/images/S/spiderman-face-logo-CEAE664BB1-seeklogo.com.png',
          description: 'Description 5',
          comicsAmmount: '652'),
    ];
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 10.0, // spacing between rows
          crossAxisSpacing: 2.0, // spacing between columns
          mainAxisExtent: 250,
        ),
        itemCount: mockItemList.length,
        itemBuilder: ((context, index) {
          return CharacterCardWidget(
            imageUrl: mockItemList[index].imageUrl,
            description: mockItemList[index].description,
            comicsAmmount: mockItemList[index].comicsAmmount,
          );
        }),
      ),
    );
  }
}

///MOCKING THE CARD LIST

class CharacterCardItem {
  final String imageUrl;
  final String description;
  final String comicsAmmount;

  CharacterCardItem(
      {required this.imageUrl,
      required this.description,
      required this.comicsAmmount});
}
