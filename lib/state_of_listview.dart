import 'package:flutter/material.dart';
import 'package:fs05/models/service.dart';

import 'models/post.dart';

class StateOfListView extends ChangeNotifier {
  List<Post>? _posts = [];
  List<Post>? get posts => _posts;

  bool _loading = false;
  bool get loading => _loading;

  bool _error = false;
  bool get error => _error;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final Service _service = Service();

  void setError(bool value, String? message) {
    _error = value;
    _errorMessage = message;
    notifyListeners();
  }

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void setData(List<Post>? val) {
    _posts = val;
    notifyListeners();
  }

  Future<void> getAllPost() async {
    setLoading(true);
    List<Post>? newList = await _service.getPost(
      onError: (message) {
        setError(true, message);
        setLoading(false);
      },
    );
    setData(newList);
    setLoading(false);
  }
}
