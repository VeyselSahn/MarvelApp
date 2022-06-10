import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/core_shelf.dart';
import '../../../core/init/init_shelf.dart';
import '../../detail_page/view/detail_page.dart';
import '../model/character_model.dart';
import '../viewModel/home_view_model.dart';

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
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Image.network(
                    model.photoUrl!,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(
                model.name!,
                style: Theme.of(GlobalVars.context!).textTheme.headline5,
              )
            ],
          )),
    ),
  );
}
