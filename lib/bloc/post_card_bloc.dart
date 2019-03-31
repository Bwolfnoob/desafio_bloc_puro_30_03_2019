import 'package:desafio_bloc_puro_30_03_2019/model/post.dart';
import 'package:rxdart/rxdart.dart';

class PostCardBloc {
  var _favoriteListController = BehaviorSubject<List<Post>>();
  Observable<List<Post>> get favoritesFlux => _favoriteListController.stream;
  Sink<List<Post>> get favoritesSink => _favoriteListController.sink;

  var _isInfavoriteListController = BehaviorSubject<bool>();
  Observable<bool> get isInFavoritesFlux => _isInfavoriteListController.stream;
  Sink<bool> get isInFavoritesSink => _isInfavoriteListController.sink;

  PostCardBloc(Post post) {
    favoritesFlux
        .map((dados) => dados.contains(post))
        .listen(isInFavoritesSink.add);
  }

  dispose() {
    _isInfavoriteListController.close();
    _favoriteListController.close();
  }
}
