import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_task/screen/home_page/component/search_form_widget.dart';
import 'package:path_task/screen/home_page/viewModel/home_view_model.dart';

import '../component/loading_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(homeViewModel);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: InkWell(
          onTap: () => ref.refresh(homeViewModel),
          child: Text(
            'MARVEL',
            style: TextStyle(color: Colors.red.shade800, fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
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
            // ignore: prefer_const_constructors
            child: viewModel.loading
                ? loadingWidget()
                : viewModel.notFound
                    ? const Center(
                        child: Text('Character couldnt found'),
                      )
                    : characterGridView(viewModel.searchList.isEmpty ? viewModel.characters : viewModel.searchList),
          )
        ],
      ),
    );
  }

  GridView characterGridView(List list) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .7),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.red.shade800,
                  image: DecorationImage(
                      image: NetworkImage(
                        list.elementAt(index).photoUrl,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      list.elementAt(index).name,
                      style: TextStyle(color: Colors.red.shade800, fontSize: 20, fontWeight: FontWeight.w600),
                    ))),
          );
        });
  }
}
