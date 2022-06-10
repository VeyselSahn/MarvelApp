import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_task/core/core_shelf.dart';
import 'package:path_task/main.dart';
import 'package:path_task/screen/home_page/viewModel/home_view_model.dart';

void main() {
  testWidgets(
    'Home Page Test',
    (tester) async {
      Locators.instance.setUpLocators();
      await tester.pumpWidget(const MyApp());

      final container = ProviderContainer();
      var homeViewModelProvider = container.read(homeViewModel);

      /// expect(homeViewModelProvider.characters, isList);
      /// expect(homeViewModelProvider.characters, isNotEmpty);

      var item = find.byKey(Key(homeViewModelProvider.characters.elementAt(2).id.toString()));
      await tester.tap(item);
      await tester.pump();

      expect(find.text('1'), findsOneWidget);

      /// expect(find.text('0'), findsNothing);
    },
  );

  /// testWidgets(
  ///   'Detail Page Test',
  ///   (tester) async {
  ///     await tester.pumpWidget(const ProviderScope(child: ComicsWidget(characterID: 1012767)));

  ///     expect(find.text('1'), findsOneWidget);
  ///     expect(find.text('0'), findsNothing);
  ///   },
  /// );
}
