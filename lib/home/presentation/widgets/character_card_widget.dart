import 'package:flutter/material.dart';

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
    return Stack(
      fit: StackFit.loose,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          constraints: BoxConstraints.loose(const Size(150.0, 200.0)),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        Positioned(
          top: 5,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
