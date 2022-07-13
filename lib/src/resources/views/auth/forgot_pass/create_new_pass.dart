import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../blocs/auth/forgot_pass_bloc.dart';
import '../components/button.dart';
import '../../../constants.dart';
import '../components/back_icon.dart';
import '../components/bg_image.dart';
import '../components/header.dart';
import '../sign_in_screen/sign_in_screen.dart';

class CreateNewPassScreen extends StatefulWidget {
  const CreateNewPassScreen({super.key});

  @override
  State<CreateNewPassScreen> createState() => _CreateNewPassScreenState();
}

class _CreateNewPassScreenState extends State<CreateNewPassScreen> {
  ForgotPassword bloc = ForgotPassword();

  bool passwordStatus = true;

  final TextEditingController _rePassController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void onNextClick() {
    bool isValid = bloc.isValidChangePass(
      _passController.text.trim(),
      _rePassController.text.trim(),
    );

    if (isValid) {}
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: kDefaultPadding * 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2),
                    child: Row(
                      children: const [
                        BackIcon(),
                        Header(
                          text: 'Forgot Password',
                          icon: 'assets/icons/lock.svg',
                          slogan: 'Create your new password',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      children: [
                        BgImage(
                          size: size,
                          imageUrl: 'assets/images/bg-new-pass.svg',
                        ),
                        passInput(),
                        const SizedBox(height: kDefaultPadding),
                        rePassInput(),
                        const SizedBox(height: kDefaultPadding),
                        button(context, size),
                        const SizedBox(height: kDefaultPadding * 3),
                      ],
                    ),
                  )
                ],
              ),
              footer(size)
            ],
          ),
        ),
      ),
    );
  }

  Widget rePassInput() => StreamBuilder(
        stream: bloc.rePassStream,
        builder: (context, snapshot) => TextField(
          controller: _rePassController,
          maxLength: 100,
          cursorHeight: 20,
          obscureText: passwordStatus,
          style: GoogleFonts.outfit(color: kContentColorLightTheme),
          textInputAction: TextInputAction.done,
          decoration: inputDecoration(
            'Re New Password',
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
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
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
          textInputAction: TextInputAction.next,
          decoration: inputDecoration(
            'New Password',
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

  Widget button(BuildContext context, Size size) => Button(
        width: size.width - kDefaultPadding * 2,
        text: 'Next',
        backgroundColor: kPrimaryColor,
        press: () => onNextClick(),
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
          Text('You have an account?',
              style: AuthStyle.kLightThemeRegularTextStyle),
          GestureDetector(
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) => const SignInScreen()),
                (route) => false),
            child: Text(
              ' Sign in',
              style: AuthStyle.kLightThemeBoldTextStyle,
            ),
          ),
        ],
      );
}
