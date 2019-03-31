import 'package:desafio_bloc_puro_30_03_2019/favorite/favorite_page_mixin.dart';
import 'package:desafio_bloc_puro_30_03_2019/model/post.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with FavoritePageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Favorite Bloc Puro"),
        ),
      ),
      body: Container(
        child: StreamBuilder<List<Post>>(
            initialData: List<Post>(),
            stream: bloc.favoriteListFlux,
            builder: (context, snapshot) {
              print(snapshot);
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.data.isEmpty) {
                return Center(child: Text("Nenhum item favorite"));
              }

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (item) {
                      bloc.favoriteDeleteSink.add(snapshot.data[index]);
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].body),
                        leading: CircleAvatar(
                          child:
                              Text(snapshot.data[index].title.substring(0, 1)),
                        ),
                      ),
                    ),
                    key: Key("${snapshot.data[index].id}"),
                  );
                },
              );
            }),
      ),
    );
  }
}
