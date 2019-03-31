import 'package:desafio_bloc_puro_30_03_2019/bloc/favorite_bloc.dart';
import 'package:desafio_bloc_puro_30_03_2019/favorite/favorite_page.dart';
import 'package:flutter/material.dart';

mixin FavoritePageMixin<T extends StatefulWidget> on State<FavoritePage> {
  FavoriteBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = FavoriteBloc();
  }
}
