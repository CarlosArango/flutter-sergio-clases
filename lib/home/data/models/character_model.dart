import 'package:flutter_application_improves/home/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required String name,
    required String urlImg,
    required int comicsQuantity,
  }) : super(
          name: name,
          urlImg: urlImg,
          comicsQuantity: comicsQuantity,
        );

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    final thumbnail = map['thumbnail'];
    final urlImg = "${thumbnail['path']}.${thumbnail['extension']}";

    return CharacterModel(
      name: map['name'] ?? '',
      comicsQuantity: map['comics']['available'] ?? '',
      urlImg: urlImg,
    );
  }
}
