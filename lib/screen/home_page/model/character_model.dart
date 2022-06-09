class CharacterModel {
  String? name;
  String? photoUrl;
  String? description;
  int? id;
  CharacterModel({this.name, this.photoUrl, this.description, this.id});

  factory CharacterModel.fromJson(Map? map) {
    return CharacterModel(
        name: map?['name'] ?? 'Not Found',
        photoUrl: map?['thumbnail']['path'] + '/portrait_xlarge.' + map?['thumbnail']['extension'],
        description: map?['description'] ?? '',
        id: map?['id'] ?? 0);
  }
  Map<String, dynamic> toJson() {
    return {"name": name, "photoUrl": photoUrl, "description": description, "id": id};
  }
}
