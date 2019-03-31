import 'package:desafio_bloc_puro_30_03_2019/model/favorite.dart';
import 'package:desafio_bloc_puro_30_03_2019/model/post.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteBloc {
  final Favorite _favorite = Favorite.instance();

  final _favoriteListController = BehaviorSubject<List<Post>>();

  Observable<List<Post>> get favoriteListFlux => _favoriteListController.stream;
  Sink<List<Post>> get favoriteListSink => _favoriteListController.sink;

  final _favoriteAddController = BehaviorSubject<Post>();
  Observable<Post> get favoriteAddFlux => _favoriteAddController.stream;
  Sink<Post> get favoriteAddSink => _favoriteAddController.sink;

  final _favoriteDeleteController = BehaviorSubject<Post>();
  Observable<Post> get favoriteDeleteFlux => _favoriteDeleteController.stream;
  Sink<Post> get favoriteDeleteSink => _favoriteDeleteController.sink;

  FavoriteBloc() {
    _favoriteAddController.listen(_handleAdd);
    _favoriteDeleteController.listen(_handleDelete);
    _handleUpdate();
  }

  void _handleAdd(Post post) {
    _favorite.add(post);
    _handleUpdate();
  }

  void _handleDelete(Post post) {
    _favorite.delete(post);
    _handleUpdate();
  }

  void _handleUpdate() {
    _favoriteListController.add(_favorite.favorite);
  }

  dispose() {
    _favoriteListController.close();
    _favoriteAddController.close();
    _favoriteDeleteController.close();
  }
}
