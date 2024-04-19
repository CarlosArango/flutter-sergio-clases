import 'package:flutter/material.dart';

import 'package:flutter_application_improves/home/presentation/widgets/tabs_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Column(
        children: [HomePageHeaderWidget(), HomePageBodyWidget()],
      ),
    );
  }
}

class ListViewNumbers extends StatelessWidget {
  const ListViewNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> numbers = List.generate(100, (index) => index + 1);

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${numbers[index]}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  onTap: () {
                    // Acción cuando se selecciona un número en la lista
                    print('Número seleccionado: ${numbers[index]}');
                  },
                );
              },
            ),
          )
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
    return Flexible(
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
          const CardListWidget(),
        ],
      ),
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
      CharacterCardItem(
          imageUrl: 'url1', description: 'Description 1', comicsAmmount: '25'),
      CharacterCardItem(
          imageUrl: 'url2', description: 'Description 2', comicsAmmount: '32'),
      // CharacterCardItem(
      //     imageUrl: 'url3', description: 'Description 3', comicsAmmount: '55'),
      // CharacterCardItem(
      //     imageUrl: 'url4', description: 'Description 4', comicsAmmount: '328'),
      // CharacterCardItem(
      //     imageUrl: 'url5', description: 'Description 5', comicsAmmount: '652'),
    ];
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns
        ),
        itemCount: mockItemList.length,
        itemBuilder: ((context, index) {
          return Flexible(
            fit: FlexFit.loose,
            child: CharacterCardWidget(
              imageUrl: mockItemList[index].imageUrl,
              description: mockItemList[index].description,
              comicsAmmount: mockItemList[index].comicsAmmount,
            ),
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
      color: Colors.black,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: 20,
        width: 7000,
      ),
    );
  }
}
