import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core_shelf.dart';
import '../model/comic_model.dart';
import '../viewModel/detail_view_model.dart';

class ComicsWidget extends ConsumerWidget {
  final int characterID;
  const ComicsWidget({required this.characterID, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.read(detailViewModel);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Comics', style: Theme.of(context).textTheme.subtitle2),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<dynamic>(
            future: viewModel.getComics(characterID),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: viewModel.comics.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => comicTileWidget(viewModel.comics.elementAt(index)),
              );
            }),
      ],
    );
  }

  Padding comicTileWidget(ComicModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 80,
        child: ListTile(
          shape: const RoundedRectangleBorder(
              side: BorderSide(
            color: Colors.white,
          )),
          leading: Image.network(model.photoUrl!, fit: BoxFit.cover),
          title: Text(model.title!),
          subtitle: Text(
            model.description!,
            style: TextStyle(color: Colors.grey.shade400),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(model.date.toString(), style: Theme.of(GlobalVars.context!).textTheme.subtitle2),
        ),
      ),
    );
  }
}
