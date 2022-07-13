import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../blocs/auth/sign_up_bloc.dart';
import '../components/button.dart';
import '../../../constants.dart';
import '../components/bg_image.dart';
import '../components/header.dart';
import '../enter_code_screen/enter_code_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpBloc bloc = SignUpBloc();

  final TextEditingController _emailController = TextEditingController();

  void onNextClicked() {
    bool isValid = bloc.isValidInfo(_emailController.text.trim());
    if (isValid) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (BuildContext context) =>
              const EnterCodeScreen(newAccount: true),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F6),
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
                      text: 'Sign Up',
                      icon: 'assets/icons/user.svg',
                      slogan: 'Create your account to experience',
                    ),
                    const SizedBox(height: kDefaultPadding),
                    BgImage(
                      size: size,
                      imageUrl: 'assets/images/bg-sign-up.svg',
                    ),
                    emailInput(),
                    const SizedBox(height: kDefaultPadding),
                    button(context, size),
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

  Widget emailInput() => StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          controller: _emailController,
          maxLength: 50,
          cursorHeight: 20,
          style: GoogleFonts.outfit(
            color: kContentColorLightTheme,
          ),
          textInputAction: TextInputAction.done,
          decoration: inputDecoration(
            'Email',
            snapshot.hasError ? snapshot.error : null,
          ),
        );
      });

  InputDecoration inputDecoration(String hintText, errorText) =>
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
        focusedBorder: AuthStyle.kInputBorder,
        enabledBorder: AuthStyle.kNoBorder,
        errorBorder: AuthStyle.kNoBorder,
        focusedErrorBorder: AuthStyle.kInputBorder,
      );

  Widget button(BuildContext context, Size size) => Button(
        width: size.width - kDefaultPadding * 2,
        text: 'Next',
        backgroundColor: kPrimaryColor,
        press: () => onNextClicked(),
      );

  Widget footer(Size size) => Positioned(
        bottom: 0,
        right: 0,
        child: SizedBox(
          height: 50,
          width: size.width,
          child: signIn(),
        ),
      );

  Widget signIn() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have an account?',
            style: AuthStyle.kLightThemeRegularTextStyle,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              ' Sign in',
              style: AuthStyle.kLightThemeBoldTextStyle,
            ),
          ),
        ],
      );
}
