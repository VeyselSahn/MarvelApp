class ServiceConsant {
  String baseUrl = 'http://gateway.marvel.com/v1/public/';
  final String _hash = 'hash=f42f55ea6acd4933686aacd9f75fe6c7';
  final String _publicKey = 'apikey=75d295aeb549a8cbedd82626285d6d48';
  final String _ts = 'ts=1';

  final String _charactersPath = 'characters';
  final String _comicsPath = 'comics';
  String get _auth => '?' + _ts + '&' + _publicKey + '&' + _hash;

  //character
  String prepareCharactersPath(int offset) {
    return _charactersPath + _auth + '&' + _charactersLimitKey + '&' + 'offset=$offset';
  }

  final String _charactersLimitKey = 'limit=30';

  //comics
  String prepareComicsPath(int characterID, int offset) {
    return _charactersPath +
        '/' +
        '$characterID' +
        '/' +
        _comicsPath +
        _auth +
        '&' +
        _comicsLimitKey +
        '&' +
        _comicsStartDate +
        '&' +
        'offset=$offset';
  }

  final String _comicsLimitKey = 'limit=10';
  final String _comicsStartDate = 'startYear=2005';
}
