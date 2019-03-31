import 'package:desafio_bloc_puro_30_03_2019/model/post.dart';
import 'package:dio/dio.dart';

class PostService {
  var url = "https://jsonplaceholder.typicode.com/posts";
  Dio dio;

  PostService() {
    dio = Dio();
  }

  Future<List<Post>> getAllPosts() async {
    var result = await dio.get(url);
    List lista = (result.data as List).map((c) => Post.fromJson(c)).toList();
    return lista;
  }
}
