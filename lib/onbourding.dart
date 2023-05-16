import 'package:blogclub/auth.dart';
import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbourdingScreen extends StatefulWidget {
  const OnbourdingScreen({Key? key}) : super(key: key);

  @override
  State<OnbourdingScreen> createState() => _OnbourdingScreenState();
}

class _OnbourdingScreenState extends State<OnbourdingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBourdingItems;
  int page = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
          debugPrint('selected onBourding page: $page');
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Assets.img.background.onboarding.image(),
              ),
            ),
            Container(
              height: 280,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 30,
                      color: const Color(0x005282ff).withOpacity(0.07))
                ],
                color: themeData.colorScheme.surface,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            children: [
                              Text(
                                items[index].title,
                                style: themeData.textTheme.headline4,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                items[index].deccription,
                                style: themeData.textTheme.subtitle1!
                                    .apply(fontSizeFactor: 0.85),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(right: 32, left: 32, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: items.length,
                          effect: ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: themeData.colorScheme.primary,
                            dotColor:
                                themeData.colorScheme.primary.withOpacity(0.1),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(const Size(88, 60)),
                          ),
                          onPressed: () {
                            if (page == items.length - 1) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const AuthScreen(),
                                ),
                              );
                            } else {
                              _pageController.animateToPage(page + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                            }
                          },
                          child: Icon(
                            page == items.length - 1
                                ? CupertinoIcons.check_mark
                                : CupertinoIcons.arrow_right,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
