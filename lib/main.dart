import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fs06/modules/posts/blocs/chatty_observer_bloc.dart';
import 'package:fs06/modules/posts/pages/list_posts_cubit_page.dart';
import 'package:fs06/modules/posts/pages/list_posts_page.dart';
import 'package:fs06/modules/posts/pages/list_posts_rx_dart_page.dart';
import 'package:fs06/pages/home_page.dart';

void main() {
  Bloc.observer = ChattyObserverBloc();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => const HomePage(),
        ListPostsRxDartPage.route: (context) => const ListPostsRxDartPage(),
        ListPostsCubitPage.route: (context) => const ListPostsCubitPage(),
        ListPostsPage.route: (context) => const ListPostsPage(),
      },
    );
  }
}
