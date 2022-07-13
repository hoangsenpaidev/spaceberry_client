import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../blocs/auth/sign_up_bloc.dart';
import '../components/back_icon.dart';
import '../components/button.dart';
import '../../../constants.dart';
import '../components/bg_image.dart';
import '../components/header.dart';
import '../sign_in_screen/sign_in_screen.dart';

class CompleteAccountScreen extends StatefulWidget {
  const CompleteAccountScreen({super.key});

  @override
  State<CompleteAccountScreen> createState() => _CompleteAccountScreenState();
}

class _CompleteAccountScreenState extends State<CompleteAccountScreen> {
  SignUpBloc bloc = SignUpBloc();
  bool passwordStatus = true;
  bool isChecked = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _rePassController = TextEditingController();

  void onSignUpClick() {
    bool isValid = bloc.isValidCompleteAccount(
      _nameController.text.trim(),
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
                          text: 'Sign Up',
                          icon: 'assets/icons/user.svg',
                          slogan: 'Create your account to experience',
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
                          imageUrl: 'assets/images/bg-create-account.svg',
                        ),
                        nameInput(),
                        const SizedBox(height: kDefaultPadding),
                        passInput(),
                        const SizedBox(height: kDefaultPadding),
                        rePassInput(),
                        const SizedBox(height: kDefaultPadding / 4),
                        checkbox(size),
                        const SizedBox(height: kDefaultPadding / 4),
                        button(context, size),
                        const SizedBox(height: kDefaultPadding * 3),
                      ],
                    ),
                  ),
                ],
              ),
              footer(size)
            ],
          ),
        ),
      ),
    );
  }

  Widget checkbox(Size size) => Row(
        children: [
          Checkbox(
            value: isChecked,
            activeColor: kPrimaryColor,
            onChanged: (bool? value) => setState(() {
              isChecked = value!;
            }),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultBorderRadius / 3),
            ),
          ),
          const SizedBox(height: kDefaultPadding / 5),
          SizedBox(
            width: size.width - kDefaultPadding * 4.5,
            child: GestureDetector(
              onTap: () {},
              child: Text('I agree to the Enma terms and conditions',
                  style: AuthStyle.kLightThemeRegularTextStyle),
            ),
          ),
        ],
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
              'Password', snapshot.hasError ? snapshot.error : null, false),
        ),
      );

  Widget rePassInput() => StreamBuilder(
        stream: bloc.rePassStream,
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
              'Password', snapshot.hasError ? snapshot.error : null, true),
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

  Widget nameInput() => StreamBuilder(
        stream: bloc.usernameStream,
        builder: (context, snapshot) => TextField(
          controller: _nameController,
          maxLength: 40,
          cursorHeight: 20,
          style: GoogleFonts.outfit(color: kContentColorLightTheme),
          textInputAction: TextInputAction.next,
          decoration: inputDecoration(
              'Your Name', snapshot.hasError ? snapshot.error : null, false),
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
        text: 'Sign Up',
        disabled: !isChecked,
        backgroundColor: kPrimaryColor,
        press: () => onSignUpClick(),
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
