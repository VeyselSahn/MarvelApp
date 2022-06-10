import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core_shelf.dart';
import '../model/comic_model.dart';

final detailViewModel = ChangeNotifierProvider<DetailViewModel>((ref) {
  return DetailViewModel();
});

class DetailViewModel extends ChangeNotifier {
  int offset = 0;

  bool loading = false;

  List comics = [];
  void fillComicsList(List newList) {
    comics = newList;
    notifyListeners();
  }

  Future getComics(int id) async {
    try {
      var _resp = await GlobalVars.apiService.getData(GlobalVars.serviceConst.prepareComicsPath(id, offset));
      var _tempList = _convertToList(_resp?.data ?? []);
      fillComicsList(_tempList);
      return true;
    } on Exception {
      return false;
    }
  }

  List _convertToList(dynamic data) {
    if ((data?['data']['results'] ?? []) is List) {
      return (data?['data']['results']).map((val) => ComicModel.fromJson(val)).toList();
    } else {
      return [];
    }
  }
}
