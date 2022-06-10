import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_task/core/core_shelf.dart';
import 'package:path_task/screen/detail_page/viewModel/detail_view_model.dart';
import 'package:path_task/screen/home_page/viewModel/home_view_model.dart';

void main() {
  test(
    'Home page data fetching',
    () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      Locators.instance.setUpLocators();
      var homeViewModelProvider = container.read(homeViewModel);
      await homeViewModelProvider.getCharacters(0);

      expect(homeViewModelProvider.characters, isList);
      expect(homeViewModelProvider.characters, isNotEmpty);
    },
  );

  test(
    'detail page fetching comics',
    () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      Locators.instance.setUpLocators();
      var detailViewModelProvider = container.read(detailViewModel);
      var homeViewModelProvider = container.read(homeViewModel);
      await homeViewModelProvider.getCharacters(0);
      await detailViewModelProvider.getComics(homeViewModelProvider.characters[2].id);

      expect(detailViewModelProvider.comics, isList);
      expect(detailViewModelProvider.comics, isNotEmpty);
    },
  );
}
