import 'package:desafio_bloc_puro_30_03_2019/model/post.dart';

class Favorite {
  static Favorite _instance;

  static instance() {
    if (_instance == null) {
      _instance = new Favorite();
    }
    return _instance;
  }

  Set<Post> _favoriteList = <Post>{};

  List<Post> get favorite => _favoriteList.toList();

  void add(Post post) => _favoriteList.add(post);

  void delete(Post post) => _favoriteList.remove(post);
}
