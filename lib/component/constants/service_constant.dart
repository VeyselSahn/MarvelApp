class ServiceConsant {
  String baseUrl = 'http://gateway.marvel.com/v1/public/';
  final String _hash = 'hash=b4997b4c1b9afbd5e00fae6028b28da5';
  final String _publicKey = 'apikey=611f4dad4aa4ee1af3a0055728b2b409';
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
