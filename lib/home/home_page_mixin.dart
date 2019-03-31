import 'package:desafio_bloc_puro_30_03_2019/bloc/post_bloc.dart';
import 'package:desafio_bloc_puro_30_03_2019/favorite/favorite_page.dart';
import 'package:flutter/material.dart';

mixin HomePageMixin<T extends StatefulWidget> on State<T> {
  PostBloc bloc;

  goTofavoritepage() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return FavoritePage();
        },
        fullscreenDialog: true));
  }

  @override
  void initState() {
    super.initState();

    bloc = new PostBloc();
  }
}
