import 'package:desafio_bloc_puro_30_03_2019/model/post.dart';
import 'package:desafio_bloc_puro_30_03_2019/service/post_service.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc {
  PostService postService;

  var _postController = BehaviorSubject<List<Post>>();

  Observable<List<Post>> get postsFlux => _postController.stream;
  Sink<List<Post>> get postsSink => _postController.sink;

  PostBloc() {
    postService = new PostService();
    postService.getAllPosts().then(postsSink.add);
  }

  dispose() {
    _postController.close();
  }
}
