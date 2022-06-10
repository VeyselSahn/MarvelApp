import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core_shelf.dart';
import '../model/character_model.dart';

final homeViewModel = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel();
});

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    getCharacters(0);
    listenScroll();
  }

  bool loading = false;
  List<dynamic> characters = [];
  List get gridList => searchList.isEmpty ? characters : searchList;

  Future getCharacters(int customOffSet) async {
    _changeLoadingStatus(true);
    await GlobalVars.apiService.getData(GlobalVars.serviceConst.prepareCharactersPath(customOffSet)).then((value) {
      var _tempList = _convertToList(value?.data);
      fillCharacterList(_tempList);
    }).whenComplete(() => _changeLoadingStatus(false));
  }

  void fillCharacterList(List<dynamic> newList) {
    characters = newList;
    notifyListeners();
  }

  final ScrollController scrollController = ScrollController();

  void listenScroll() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        // for be sure
        await Future.delayed(const Duration(seconds: 1)).whenComplete(() {
          if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
            changeOffSet(true);
            getCharacters(offset);
          }
        });
      }

      if (scrollController.position.pixels == scrollController.position.minScrollExtent) {
        await Future.delayed(const Duration(seconds: 1)).whenComplete(() {
          if (scrollController.position.pixels == scrollController.position.minScrollExtent) {
            changeOffSet(false);
            getCharacters(offset);
          }
        });
      }
    });
  }

  int offset = 0;
  void changeOffSet(bool increase) {
    offset += increase ? 30 : -30;
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
        if (value.toString().toLowerCase().contains(searchWord.toLowerCase())) {
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
