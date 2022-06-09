class ServiceConsant {
  String baseUrl = 'http://gateway.marvel.com/v1/public/';
  final String _hash = 'hash=f42f55ea6acd4933686aacd9f75fe6c7';
  final String _publicKey = 'apikey=d247358bca33485534faf5e699725c95';
  final String _ts = 'ts=1';

  final String _charactersPath = 'characters';

  String get getCharacterPath => _charactersPath + '?' + _ts + '&' + _publicKey + '&' + _hash;
}
