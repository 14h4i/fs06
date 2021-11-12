import 'package:flutter/material.dart';
import 'package:fs06/modules/posts/blocs/list_posts_rx_dart_bloc.dart';
import 'package:fs06/modules/posts/models/post.dart';
import 'package:fs06/modules/posts/widgets/post_item.dart';

class ListPostsRxDartPage extends StatefulWidget {
  static const route = '/rxdart';
  const ListPostsRxDartPage({Key? key}) : super(key: key);

  @override
  _ListPostsPageState createState() => _ListPostsPageState();
}

class _ListPostsPageState extends State<ListPostsRxDartPage> {
  final _postsBloc = ListPostsRxDartBloc();

  @override
  void initState() {
    super.initState();
    _postsBloc.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List posts page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: _buildLogo(),
        onPressed: () {},
      ),
      body: StreamBuilder<List<Post>?>(
        stream: _postsBloc.postsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final posts = snapshot.data;
            return ListView.builder(
              itemBuilder: (_, int index) {
                final item = posts![index];
                return PostItem(
                  height: 200,
                  url: item.images?.first.url ?? '',
                  description: item.description!,
                );
              },
              itemCount: posts?.length ?? 0,
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildLogo() {
    // print('_buildLogo ------- build');
    return SizedBox(
      width: 64,
      height: 64,
      child: Image.asset('assets/images/flutter_logo.png'),
    );
  }
}
