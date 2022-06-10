import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../component/widgets/appbar.dart';
import '../../../component/widgets/snackbar.dart';
import '../../../core/core_shelf.dart';
import '../component/search_form_widget.dart';
import '../viewModel/home_view_model.dart';
import '../component/character_gridview.dart';
import '../component/loading_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(homeViewModel);
    return Scaffold(
      appBar: appBar('MARVEL'),
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
