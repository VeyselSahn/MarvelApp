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
    GlobalVars.apiService.getData(GlobalVars.serviceConst.getCharacterPath).then((value) {
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
  bool notFound = false;

  void search(String searchWord) {
    searchList.clear();
    for (var element in characters) {
      (element as CharacterModel).toJson().values.forEach((value) {
        if (value.toString().contains(searchWord)) {
          searchList.contains(element) ? null : searchList.add(element);
        }
      });
    }
    if (controller.text.isNotEmpty && searchList.isEmpty) {
      notFound = true;
    } else {
      notFound = false;
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
