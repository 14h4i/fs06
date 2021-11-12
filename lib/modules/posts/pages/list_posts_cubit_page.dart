import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fs06/modules/posts/blocs/list_posts_cubit_bloc.dart';
import 'package:fs06/modules/posts/models/post.dart';
import 'package:fs06/modules/posts/widgets/post_item.dart';

class ListPostsCubitPage extends StatefulWidget {
  static const route = '/cubit';
  const ListPostsCubitPage({Key? key}) : super(key: key);

  @override
  _ListPostsPageState createState() => _ListPostsPageState();
}

class _ListPostsPageState extends State<ListPostsCubitPage> {
  final _postsBloc = ListPostsCubitBloc();

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
      body: BlocBuilder<ListPostsCubitBloc, List<Post>?>(
        bloc: _postsBloc,
        builder: (context, posts) {
          if (posts != null) {
            return ListView.builder(
              itemBuilder: (_, int index) {
                final item = posts[index];
                return PostItem(
                  height: 200,
                  url: item.images?.first.url ?? '',
                  description: item.description!,
                );
              },
              itemCount: posts.length,
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
