import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/core_shelf.dart';
import '../viewModel/home_view_model.dart';

class SearchFormWidget extends ConsumerWidget {
  const SearchFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch<HomeViewModel>(homeViewModel);
    return SizedBox(
      width: context.deviceWidth * .8,
      child: TextFormField(
        controller: viewModel.controller,
        onChanged: (value) async =>
            await Future.delayed(const Duration(seconds: 1)).then((x) => viewModel.search(value)),
        decoration: const InputDecoration(hintText: 'Search character'),
      ),
    );
  }
}
