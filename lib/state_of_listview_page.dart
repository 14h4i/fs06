import 'package:flutter/material.dart';
import 'package:fs05/core/base_provider.dart';
import 'package:fs05/models/widgets/empty.dart';
import 'package:fs05/models/widgets/error.dart';
import 'package:fs05/state_of_listview.dart';
import 'package:provider/provider.dart';

import 'models/widgets/post_item.dart';

class StateOfListViewPage extends StatefulWidget {
  const StateOfListViewPage({Key? key}) : super(key: key);
  static const routeName = 'stateOfListViewPage';
  @override
  _StateOfListViewPageState createState() => _StateOfListViewPageState();
}

class _StateOfListViewPageState extends State<StateOfListViewPage> {
  late StateOfListView _state;

  @override
  void initState() {
    _state = StateOfListView();
    super.initState();
    _state.getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF242A37),
      appBar: AppBar(
        title: const Text('State of ListView'),
      ),
      body: ChangeNotifierProvider<StateOfListView>(
          create: (_) => _state,
          child: BaseProvider<StateOfListView>(
              model: _state,
              builder: (context, model, child) {
                return model.loading
                    ? const Center(
                        child: Text('Loading',
                            style: TextStyle(color: Colors.white)))
                    : RefreshIndicator(
                        onRefresh: model.getAllPost,
                        child: model.error
                            ? Error(message: model.errorMessage)
                            : model.posts!.isEmpty
                                ? const Empty()
                                : ListView.builder(
                                    itemCount: model.posts!.length,
                                    itemBuilder: (context, index) {
                                      // print(model.posts![index].images!.first.url!);
                                      return PostItem(
                                        fullName: model.posts![index].fullName,
                                        caption:
                                            model.posts![index].description,
                                        avatar: model.posts![index].avatar,
                                        tags: model.posts![index].tags,
                                        createdAt:
                                            model.posts![index].createdAt!,
                                        height: size.height * 0.5,
                                        url: model
                                            .posts![index].images!.first.url!,
                                        radiusAvatar: 24,
                                      );
                                    }),
                      );
              })),
    );
  }
}
