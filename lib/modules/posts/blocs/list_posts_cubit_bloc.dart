import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fs06/modules/posts/models/post.dart';
import 'package:fs06/modules/posts/services/list_posts_service.dart';

class ListPostsCubitBloc extends Cubit<List<Post>?> {
  ListPostsCubitBloc() : super(null);

  Future<void> getPosts() async {
    try {
      final res = await ListPostsService().getPosts();
      if (res != null) {
        emit(res);
      }
    } catch (e) {
      debugPrint('$e');
      emit([]);
    }
  }
}
