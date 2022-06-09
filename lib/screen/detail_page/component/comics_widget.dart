import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_task/screen/detail_page/viewModel/detail_view_model.dart';

class ComicsWidget extends ConsumerWidget {
  final int characterID;
  const ComicsWidget({required this.characterID, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(detailViewModel);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Comics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            )),
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
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => SizedBox(
                  height: 80,
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                      color: Colors.white,
                    )),
                    leading: Image.network(viewModel.comics.elementAt(index).photoUrl, fit: BoxFit.cover),
                    title: Text(viewModel.comics.elementAt(index).title),
                    subtitle: Text(
                      viewModel.comics.elementAt(index).description,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(viewModel.comics.elementAt(index).date.toString()),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
