import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/rooms.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              buildSearchIcon(),
              buildBuildMessengerIcon(),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 5),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index){
              final Post post = posts[index];
              return PostContainer(post: post);
          },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }

  CircleButton buildSearchIcon() {
    return CircleButton(
      icon: Icons.search,
      iconSize: 30,
      onPressed: () => print('Search'),
    );
  }

  CircleButton buildBuildMessengerIcon() {
    return CircleButton(
      icon: MdiIcons.facebookMessenger,
      iconSize: 30,
      onPressed: () => print('Messenger'),
    );
  }
}
