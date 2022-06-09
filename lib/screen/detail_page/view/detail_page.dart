import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_task/screen/detail_page/component/comics_widget.dart';
import 'package:path_task/screen/home_page/model/character_model.dart';

import '../component/define_widget.dart';

class DetailScreen extends ConsumerWidget {
  final CharacterModel model;
  const DetailScreen(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(226, 54, 54, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            children: [
              DefineWidget(
                model: model,
              ),
              const SizedBox(
                height: 10,
              ),
              ComicsWidget(
                characterID: model.id!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
