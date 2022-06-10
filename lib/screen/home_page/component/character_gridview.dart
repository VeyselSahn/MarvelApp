import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_task/core/core_shelf.dart';
import 'package:path_task/screen/detail_page/view/detail_page.dart';
import 'package:path_task/screen/home_page/model/character_model.dart';
import 'package:path_task/screen/home_page/viewModel/home_view_model.dart';

class CharacterGridView extends ConsumerWidget {
  final List list;
  const CharacterGridView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        controller: ref.read(homeViewModel).scrollController,
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .7),
        itemBuilder: (context, index) {
          return characterCard(list.elementAt(index));
        });
  }
}

Widget characterCard(CharacterModel model) {
  return InkWell(
    onTap: () => GlobalVars.navigationService.navigateTo(DetailScreen(model)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.red.shade800,
            image: DecorationImage(
                image: NetworkImage(
                  model.photoUrl!,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                model.name!,
                style: TextStyle(color: Colors.red.shade800, fontSize: 20, fontWeight: FontWeight.w600),
              ))),
    ),
  );
}
