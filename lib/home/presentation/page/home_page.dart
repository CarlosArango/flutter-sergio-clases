import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text(
            "Personajes del mundo de Marvel",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 20,
          ),
          TextField(
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(30, 176, 176, 176),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              prefixIcon: const Icon(Icons.search_rounded),
              hintText: 'Buscar',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 32),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageBodyWidget extends StatefulWidget {
  const HomePageBodyWidget({super.key});

  @override
  State<HomePageBodyWidget> createState() => _HomePageBodyWidgetState();
}

class _HomePageBodyWidgetState extends State<HomePageBodyWidget> {
  int _selectedIndex = 0;
  final _options = ['A', 'B', 'C', 'D'];

  indexState(index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabWidget(
          options: _options,
          selectedIndex: _selectedIndex,
          onTabChanged: indexState,
        ),
        // CardListWidget(),
      ],
    );
  }
}

class CustomTabWidget extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const CustomTabWidget({
    Key? key,
    required this.options,
    required this.selectedIndex,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        final isSelected = index == selectedIndex;

        return GestureDetector(
          onTap: () => onTabChanged(index),
          child: Container(
            padding: const EdgeInsets.only(left: 5, right: 35),
            decoration: BoxDecoration(
              // color: isSelected ? Colors.black : Colors.transparent,
              // borderRadius: BorderRadius.circular(8),

              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(
                    color: isSelected ? Colors.red : Colors.transparent,
                    width: 2),
              ),
            ),
            child: Text(
              option,
              style: TextStyle(
                  color: isSelected ? Colors.red : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        );
      }).toList(),
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

class CardListWidget extends StatelessWidget {
  const CardListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CharacterCardItem> mockItemList = [
      // CharacterCardItem(
      //     imageUrl: 'url1', description: 'Description 1', comicsAmmount: '25'),
      // CharacterCardItem(
      //     imageUrl: 'url2', description: 'Description 2', comicsAmmount: '32'),
      // CharacterCardItem(
      //     imageUrl: 'url3', description: 'Description 3', comicsAmmount: '55'),
      // CharacterCardItem(
      //     imageUrl: 'url4', description: 'Description 4', comicsAmmount: '328'),
      // CharacterCardItem(
      //     imageUrl: 'url5', description: 'Description 5', comicsAmmount: '652'),
    ];
    return Expanded(
      child: ListView.builder(
        itemCount: (mockItemList.length / 2).ceil(),
        itemBuilder: ((context, index) {
          return Row(
            children: [
              Flexible(
                  fit: FlexFit.loose,
                  child: CharacterCardWidget(
                    imageUrl: mockItemList[index * 2].imageUrl,
                    description: mockItemList[index * 2].description,
                    comicsAmmount: mockItemList[index * 2].comicsAmmount,
                  )),
              const SizedBox(width: 8),
              Flexible(
                fit: FlexFit.loose,
                child: index * 2 + 1 < mockItemList.length
                    ? CharacterCardWidget(
                        imageUrl: mockItemList[index * 2 + 1].imageUrl,
                        description: mockItemList[index * 2 + 1].description,
                        comicsAmmount:
                            mockItemList[index * 2 + 1].comicsAmmount,
                      )
                    : const SizedBox(),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class CharacterCardWidget extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String comicsAmmount;

  const CharacterCardWidget({
    Key? key,
    required this.imageUrl,
    required this.description,
    required this.comicsAmmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
