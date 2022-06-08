class CharacterModel {
  String? name;
  String? photoUrl;
  CharacterModel({this.name, this.photoUrl});

  factory CharacterModel.fromJson(Map? map) {
    return CharacterModel(
        name: map?['name'] ?? 'Not Found',
        photoUrl: map?['thumbnail']['path'] + '/portrait_large.' + map?['thumbnail']['extension']);
  }
  Map<String, String> toJson() {
    return {"name": name ?? '', "photoUrl": photoUrl ?? ''};
  }
}
