import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const loginTab = 0;
  static const signUpTab = 1;
  int selectedTabIndex = loginTab;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32, top: 32),
              child: Assets.img.icons.logo.svg(width: 100),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: themeData.colorScheme.primary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = loginTab;
                              });
                            },
                            child: Text(
                              'login'.toUpperCase(),
                              style: tabTextStyle.apply(
                                  color: selectedTabIndex == loginTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = signUpTab;
                              });
                            },
                            child: Text(
                              'sign up'.toUpperCase(),
                              style: tabTextStyle.apply(
                                  color: selectedTabIndex == signUpTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.onPrimary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: selectedTabIndex == loginTab
                                ? _Login(themeData: themeData)
                                : _SignUp(themeData: themeData),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: themeData.textTheme.headline4,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Sign in with your account',
          style: themeData.textTheme.subtitle2,
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: () {},
          child: const Text('LOGIN'),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Forgot Your Password?'),
            SizedBox(width: 16),
            Text('Reset here')
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        const Center(
          child: Text(
            'OR SIGN IN WITH',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(height: 36, width: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(height: 36, width: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(height: 36, width: 36),
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome To BLog Club',
          style: themeData.textTheme.headline4,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Enter Your Information',
          style: themeData.textTheme.subtitle2,
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Fullname'),
          ),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: () {},
          child: const Text('LOGIN'),
        ),
        const SizedBox(
          height: 24,
        ),
        const Center(
          child: Text(
            'OR SIGN UP WITH',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(height: 36, width: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(height: 36, width: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(height: 36, width: 36),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: const Text('Password'),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'show' : 'hide',
            style: TextStyle(
                fontSize: 14, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
