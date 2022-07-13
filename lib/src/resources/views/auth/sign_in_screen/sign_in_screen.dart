import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../blocs/auth/login_bloc.dart';
import '../../overview/overview.dart';
import '../components/button.dart';
import '../../../constants.dart';
import '../components/bg_image.dart';
import '../components/header.dart';
import '../forgot_pass/enter_email_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  LoginBloc bloc = LoginBloc();

  bool passwordStatus = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void onSignInClicked() {
    bool isValid = bloc.isValidInfo(
      _emailController.text.trim(),
      _passController.text.trim(),
    );
    if (isValid) {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
              builder: (BuildContext context) => const OverView()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SvgPicture.asset('assets/images/bg.svg',
                  width: size.width, height: size.height),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: kDefaultPadding * 2),
                    const Header(
                        text: 'Sign In',
                        icon: 'assets/icons/user.svg',
                        slogan: 'Welcome to Enma!'),
                    const SizedBox(height: kDefaultPadding),
                    BgImage(
                      size: size,
                      imageUrl: 'assets/images/bg-login.svg',
                    ),
                    emailInput(),
                    const SizedBox(height: kDefaultPadding),
                    passInput(),
                    const SizedBox(height: kDefaultPadding / 2),
                    forgotPassBtn(),
                    const SizedBox(height: kDefaultPadding / 2),
                    button(context, size),
                    const SizedBox(height: kDefaultPadding),
                    loginWith(size),
                    const SizedBox(height: kDefaultPadding * 1.5),
                    googleLoginBtn(),
                    const SizedBox(height: kDefaultPadding * 3),
                  ],
                ),
              ),
              footer(size)
            ],
          ),
        ),
      ),
    );
  }

  Widget footer(Size size) => Positioned(
        bottom: 0,
        right: 0,
        child: SizedBox(
          height: 50,
          width: size.width,
          child: signUp(),
        ),
      );

  Widget signUp() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You don’t have an account?',
            style: AuthStyle.kLightThemeRegularTextStyle,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => const SignUpScreen(),
              ),
            ),
            child: Text(
              ' Sign up',
              style: AuthStyle.kLightThemeBoldTextStyle,
            ),
          ),
        ],
      );

  Widget googleLoginBtn() => GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                'assets/icons/google.svg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: kDefaultPadding / 4),
            Text(
              'Google',
              style: AuthStyle.kLightThemeBoldTextStyle,
            ),
          ],
        ),
      );

  Widget loginWith(Size size) => Stack(
        children: [
          const Divider(
            color: kContentColorLightTheme,
            thickness: 0.5,
            indent: kDefaultPadding,
            endIndent: kDefaultPadding,
          ),
          Positioned(
            left: ((size.width - kDefaultPadding * 2) - 120) / 2,
            bottom: 0,
            child: Container(
              width: 120,
              color: const Color(0xFFF6F6F6),
              child: Center(
                child: Text(
                  'Or Login with',
                  style: AuthStyle.kLightThemeRegularTextStyle,
                ),
              ),
            ),
          ),
        ],
      );

  Widget forgotPassBtn() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
        child: Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => const EnterEmailScreen(),
              ),
            ),
            child: Text('Forgot password?',
                style: AuthStyle.kLightThemeRegularTextStyle),
          ),
        ),
      );

  Widget button(BuildContext context, Size size) => Button(
        width: size.width - kDefaultPadding * 2,
        text: 'Login',
        backgroundColor: kPrimaryColor,
        press: () => onSignInClicked(),
      );

  Widget passInput() => StreamBuilder(
        stream: bloc.passStream,
        builder: (context, snapshot) => TextField(
          controller: _passController,
          maxLength: 100,
          cursorHeight: 20,
          obscureText: passwordStatus,
          style: GoogleFonts.outfit(
            color: kContentColorLightTheme,
          ),
          textInputAction: TextInputAction.done,
          decoration: inputDecoration(
            'Password',
            snapshot.hasError ? snapshot.error : null,
            true,
          ),
        ),
      );

  Widget passStatus() => GestureDetector(
        onTap: () => setState(() {
          passwordStatus = passwordStatus == true ? false : true;
        }),
        child: SizedBox(
          width: 30,
          height: 30,
          child: Center(
            child: Icon(
              passwordStatus != true
                  ? CupertinoIcons.eye
                  : CupertinoIcons.eye_slash,
              color: kContentColorLightTheme.withOpacity(0.8),
            ),
          ),
        ),
      );

  Widget emailInput() => StreamBuilder(
        stream: bloc.emailStream,
        builder: (context, snapshot) => TextField(
          controller: _emailController,
          maxLength: 40,
          cursorHeight: 20,
          style: GoogleFonts.outfit(
            color: kContentColorLightTheme,
          ),
          textInputAction: TextInputAction.next,
          decoration: inputDecoration(
            'Email',
            snapshot.hasError ? snapshot.error : null,
            false,
          ),
        ),
      );

  InputDecoration inputDecoration(String hintText, errorText, bool password) =>
      InputDecoration(
        filled: true,
        fillColor: Colors.white,
        counterText: '',
        hintText: hintText,
        errorText: errorText,
        errorStyle: AppStyle.kErrorTextStyle,
        hintStyle: AuthStyle.kLightThemeRegularTextStyle,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 2),
        suffixIcon: password == true ? passStatus() : null,
        focusedBorder: AuthStyle.kInputBorder,
        enabledBorder: AuthStyle.kNoBorder,
        errorBorder: AuthStyle.kNoBorder,
        focusedErrorBorder: AuthStyle.kInputBorder,
      );
}
