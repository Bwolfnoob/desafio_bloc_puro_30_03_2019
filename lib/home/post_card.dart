import 'package:desafio_bloc_puro_30_03_2019/home/post_card_mixin.dart';
import 'package:desafio_bloc_puro_30_03_2019/model/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard(this.post, {Key key}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> with PostCardMixing {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
          title: Container(
            width: MediaQuery.of(context).size.width - 40,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 170,
                  child: Text(
                    widget.post.title,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.post.body,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          leading: StreamBuilder<bool>(
              initialData: false,
              stream: postCardBloc.isInFavoritesFlux,
              builder: (context, snapshot) {
                return IconButton(
                  icon: snapshot.data
                      ? Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        )
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    if (snapshot.data) {
                      bloc.favoriteDeleteSink.add(widget.post);
                    } else {
                      bloc.favoriteAddSink.add(widget.post);
                    }
                  },
                );
              })),
    );
  }
}
