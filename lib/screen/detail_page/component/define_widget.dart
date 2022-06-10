import 'package:flutter/material.dart';
import 'package:path_task/core/core_shelf.dart';
import 'package:path_task/screen/home_page/model/character_model.dart';

class DefineWidget extends StatelessWidget {
  final CharacterModel model;
  const DefineWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Container(
            height: context.deviceHeight * .45,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    model.photoUrl!,
                  ),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8)),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            model.name!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ExpansionTile(
          tilePadding: EdgeInsets.zero,
          initiallyExpanded: true,
          title: Text(
            'Explaine yourself',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          children: [
            Text(
              model.description!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
