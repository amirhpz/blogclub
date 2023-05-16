import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AppBar(
              backgroundColor: themeData.colorScheme.background.withOpacity(0),
              elevation: 0,
              title: const Text('Profile'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_horiz_rounded),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: themeData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.1),
                          blurRadius: 20)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 85,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      colors: [
                                        Color(0xff376AED),
                                        Color(0xff49B0E2),
                                        Color(0xff9CECFB)
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.surface,
                                      borderRadius: BorderRadius.circular(16)),
                                  width: 78,
                                  height: 78,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Column(
                                      children: [
                                        Assets.img.stories.story4
                                            .image(width: 70, height: 70),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('@joviedan'),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Jovi Daniel',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'UX Designer',
                                    style: themeData.textTheme.bodyText1!.apply(
                                        color: themeData.colorScheme.primary),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'About me',
                        style: themeData.textTheme.headline6,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                        style: themeData.textTheme.bodyText1!
                            .copyWith(fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
                Positioned(
                  left: 96,
                  right: 96,
                  bottom: 32,
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 30,
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.4))
                    ]),
                  ),
                ),
                Positioned(
                  bottom: 32,
                  right: 64,
                  left: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff2151cd),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '52',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Post',
                                  style: themeData.textTheme.bodyText1!.apply(
                                      color: themeData.colorScheme.onPrimary),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeData.colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Following',
                                style: themeData.textTheme.bodyText1!.apply(
                                    color: themeData.colorScheme.onPrimary),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '2.5K',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeData.colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Followers',
                                style: themeData.textTheme.bodyText1!.apply(
                                    color: themeData.colorScheme.onPrimary),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          'My Posts',
                          style: themeData.textTheme.headline6,
                        )),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.grid.svg(),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.table.svg())
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++) Post(post: posts[i])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
