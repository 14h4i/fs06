import 'package:fs06/modules/posts/models/post.dart';
import 'package:fs06/modules/posts/services/list_posts_service.dart';
import 'package:rxdart/rxdart.dart';

class ListPostsRxDartBloc {
  final _postsCtrl = BehaviorSubject<List<Post>?>.seeded(const []);
  Stream<List<Post>?> get postsStream => _postsCtrl.stream;

  Future<void> getPosts() async {
    try {
      final res = await ListPostsService().getPosts();
      if (res != null) {
        _postsCtrl.sink.add(res);
      }
    } catch (e) {
      _postsCtrl.sink.addError('Cannot fetch list posts right now!!!');
    }
  }
}
