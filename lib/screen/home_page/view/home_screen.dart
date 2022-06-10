import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_task/component/widgets/snackbar.dart';
import 'package:path_task/core/core_shelf.dart';
import 'package:path_task/screen/home_page/component/search_form_widget.dart';
import 'package:path_task/screen/home_page/viewModel/home_view_model.dart';
import '../component/character_gridview.dart';
import '../component/loading_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(homeViewModel);
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () => snackbar('Deneme 1 2 3 '),
          child: const Text(
            'MARVEL',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.refresh(homeViewModel),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: SearchFormWidget(),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: viewModel.loading
                  ? loadingWidget()
                  : viewModel.notFound
                      ? const Center(
                          child: Text('Character couldnt found'),
                        )
                      : CharacterGridView(list: (viewModel.gridList)),
            )
          ],
        ),
      ),
    );
  }
}
