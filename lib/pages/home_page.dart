import 'package:flutter/material.dart';
import 'package:fs06/modules/posts/pages/list_posts_cubit_page.dart';
import 'package:fs06/modules/posts/pages/list_posts_page.dart';
import 'package:fs06/modules/posts/pages/list_posts_rx_dart_page.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FS 06')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ListPostsRxDartPage.route);
              },
              child: const Text('ListPostsRxDartPage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ListPostsCubitPage.route);
              },
              child: const Text('ListPostsCubitPage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ListPostsPage.route);
              },
              child: const Text('ListPostsPage'),
            ),
          ],
        ),
      ),
    );
  }
}
