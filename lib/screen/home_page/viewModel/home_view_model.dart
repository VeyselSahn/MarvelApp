import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_task/core/core_shelf.dart';
import 'package:path_task/screen/home_page/model/character_model.dart';

final homeViewModel = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel();
});

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    _changeLoadingStatus(true);
    GlobalVars.apiService
        .getData('characters?ts=1&apikey=d247358bca33485534faf5e699725c95&hash=f42f55ea6acd4933686aacd9f75fe6c7')
        .then((value) {
      var _tempList = _convertToList(value?.data);
      fillCharacterList(_tempList);
    }).whenComplete(() => _changeLoadingStatus(false));
  }

  bool loading = false;
  List<dynamic> characters = [];

  void fillCharacterList(List<dynamic> newList) {
    characters = newList;
    notifyListeners();
  }

  //searching
  final TextEditingController controller = TextEditingController();
  var searchList = [];

  void search(String searchWord) {
    searchList = [];
    for (var element in characters) {
      if ((element as CharacterModel).toJson().containsValue(searchWord)) {
        searchList.add(element);
      }
    }
    notifyListeners();
  }

  void _changeLoadingStatus(bool newStatus) {
    loading = newStatus;
    notifyListeners();
  }

  List _convertToList(dynamic data) {
    if ((data?['data']['results'] ?? []) is List) {
      return (data?['data']['results']).map((val) => CharacterModel.fromJson(val)).toList();
    } else {
      return [];
    }
  }
}
