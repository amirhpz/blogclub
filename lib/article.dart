import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        height: 48,
        width: 111,
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: themeData.colorScheme.primary.withOpacity(0.5))
          ],
        ),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'LIKED');
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(
                width: 12,
              ),
              Text(
                '2.1K',
                style: TextStyle(
                    color: themeData.colorScheme.onPrimary, fontSize: 16),
              )
            ],
          ),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: const Text('Article'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 32, left: 32, top: 16, bottom: 16),
                      child: Text(
                        'Four Things Every Woman Needs To Know',
                        style: themeData.textTheme.headline4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 24, 16, 16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Assets.img.stories.story9.image(
                                width: 40, height: 40, fit: BoxFit.cover),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Richard Gervain',
                                  style: themeData.textTheme.bodyText1!
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 8),
                                const Text('2m ago'),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.share),
                            color: themeData.colorScheme.primary,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.bookmark,
                              color: themeData.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      child: Assets.img.background.singlePost.image(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                      child: Text(
                        'A man’s sexuality is never your mind responsibility.',
                        style: themeData.textTheme.headline6,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 32, right: 32, bottom: 32),
                      child: Text(
                        'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                        style:
                            TextStyle(height: 1.5, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 116,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0.1)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
