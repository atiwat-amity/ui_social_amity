import 'package:amity_uikit_beta_service/view/social/create_post_screen.dart';
import 'package:amity_uikit_beta_service/view/social/home_following_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_social_amity/app/constants/colors.dart';

import '../../data/viewmodels/auth_view_model.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        actions: [
          GestureDetector(
            onTap: ()=> context.read<AuthViewModel>().logout(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Theme(
            data:
                Theme.of(context).copyWith(secondaryHeaderColor: Colors.white),
            child: Container(
              height: 35.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    left: 0,
                    top: 35.0 - 3,
                    child: Container(
                      width: 50,
                      height: 3,
                      color: AppColors.secondary,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(
                          'FEED',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.secondary,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: const GlobalFeedScreen(),
      floatingActionButton: GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CreatePostScreen2(),
          ));
        },
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            color: AppColors.secondary,
            child: const Icon(
              Icons.add,
              color: AppColors.primary,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
