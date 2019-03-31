import 'package:desafio_bloc_puro_30_03_2019/bloc/favorite_bloc.dart';
import 'package:desafio_bloc_puro_30_03_2019/bloc/post_card_bloc.dart';
import 'package:desafio_bloc_puro_30_03_2019/home/post_card.dart';
import 'package:flutter/material.dart';

mixin PostCardMixing<T extends StatefulWidget> on State<PostCard> {
  FavoriteBloc bloc;
  PostCardBloc postCardBloc;

  @override
  void initState() {
    postCardBloc = PostCardBloc(widget.post);

    bloc = FavoriteBloc();

    bloc.favoriteListFlux.listen(postCardBloc.favoritesSink.add);

    super.initState();
  }

  @override
  void dispose() {
    postCardBloc.dispose();
    super.dispose();
  }
}
