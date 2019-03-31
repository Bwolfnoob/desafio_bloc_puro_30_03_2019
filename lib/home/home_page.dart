import 'package:desafio_bloc_puro_30_03_2019/home/home_page_mixin.dart';
import 'package:desafio_bloc_puro_30_03_2019/home/post_card.dart';
import 'package:desafio_bloc_puro_30_03_2019/model/post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Bloc Puro"),
        ),
      ),
      body: Container(
        child: StreamBuilder<List<Post>>(
            initialData: List<Post>(),
            stream: bloc.postsFlux,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.data.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return PostCard(snapshot.data[index]);
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goTofavoritepage();
        },
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
    );
  }
}
