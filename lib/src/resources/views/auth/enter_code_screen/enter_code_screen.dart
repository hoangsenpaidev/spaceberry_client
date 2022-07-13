import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/button.dart';
import '../../../constants.dart';
import '../complete_account/complete_account_screen.dart';
import '../components/back_icon.dart';
import '../components/bg_image.dart';
import '../components/header.dart';
import '../forgot_pass/create_new_pass.dart';
import '../sign_in_screen/sign_in_screen.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key, required this.newAccount});

  final bool newAccount;

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  bool disabled = false;

  final TextEditingController _optCode_1_Controller = TextEditingController();

  final TextEditingController _optCode_2_Controller = TextEditingController();

  final TextEditingController _optCode_3_Controller = TextEditingController();

  final TextEditingController _optCode_4_Controller = TextEditingController();

  final TextEditingController _optCode_5_Controller = TextEditingController();

  void onSubmitClicked() {
    var isValid = checked(
      _optCode_1_Controller.text,
      _optCode_2_Controller.text,
      _optCode_3_Controller.text,
      _optCode_4_Controller.text,
      _optCode_5_Controller.text,
    );

    if (isValid) {
      widget.newAccount == true
          ? Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) =>
                    const CompleteAccountScreen(),
              ),
            )
          : Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => const CreateNewPassScreen(),
              ),
            );
    }
  }

  void onChangedOTP(value, bool last, bool first) {
    if (value.length == 1 && last == false) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && first == false) {
      FocusScope.of(context).previousFocus();
    }
    setState(() {
      checked(
        _optCode_1_Controller.text,
        _optCode_2_Controller.text,
        _optCode_3_Controller.text,
        _optCode_4_Controller.text,
        _optCode_5_Controller.text,
      )
          ? disabled = true
          : disabled = false;
    });
  }

  static checked(otp1, otp2, otp3, otp4, otp5) {
    return otp1.isNotEmpty &&
        otp2.isNotEmpty &&
        otp3.isNotEmpty &&
        otp4.isNotEmpty &&
        otp5.isNotEmpty;
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
                          text: 'OTP Verrification',
                          icon: 'assets/icons/user.svg',
                          slogan: 'Enter the confirmation code you received',
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
                          imageUrl: 'assets/images/bg-otp.svg',
                        ),
                        otpVerification(size),
                        const SizedBox(height: kDefaultPadding / 2),
                        otpCodeForm(context, size),
                        runTimeOTP(size),
                        const SizedBox(height: kDefaultPadding / 2),
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

  Widget runTimeOTP(Size size) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('00:00',
              style: GoogleFonts.outfit(
                fontSize: 18,
                color: kContentColorLightTheme,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              )),
          const SizedBox(height: kDefaultPadding / 4),
          SizedBox(
            width: size.width - kDefaultPadding * 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do not send OTP? ',
                  style: AuthStyle.kLightThemeRegularTextStyle,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Send OTP',
                    style: GoogleFonts.outfit(
                      fontSize: 15,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget otpVerification(Size size) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'OTP Verification',
            style: GoogleFonts.outfit(
              fontSize: 21,
              color: kContentColorLightTheme,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: kDefaultPadding / 4),
          SizedBox(
            width: size.width - kDefaultPadding * 4,
            child: Text(
              'We have sent you a one-time verification code on this Email address',
              style: AuthStyle.kLightThemeRegularTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: kDefaultPadding / 4),
          Text('hoangsenpai.dev@gmail.com',
              style: AuthStyle.kLightThemeBoldTextStyle),
        ],
      );

  Widget otpCodeForm(BuildContext context, Size size) => Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 4,
          direction: Axis.horizontal,
          runSpacing: 10,
          children: [
            otpTextField(context, size, true, false, _optCode_1_Controller),
            otpTextField(context, size, false, false, _optCode_2_Controller),
            otpTextField(context, size, false, false, _optCode_3_Controller),
            otpTextField(context, size, false, false, _optCode_4_Controller),
            otpTextField(context, size, false, true, _optCode_5_Controller),
          ],
        ),
      );

  Widget otpTextField(
    BuildContext context,
    Size size,
    bool first,
    bool last,
    controller,
  ) =>
      Container(
        height: size.shortestSide * 0.1,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: AspectRatio(
          aspectRatio: 1,
          child: TextField(
            maxLines: 1,
            maxLength: 1,
            controller: controller,
            textInputAction:
                last != true ? TextInputAction.next : TextInputAction.done,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            style: GoogleFonts.outfit(
              fontSize: 21,
              color: kContentColorLightTheme,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
            onChanged: (value) => onChangedOTP(value, last, first),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              counterText: '',
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              focusedBorder: AuthStyle.kInputBorder,
              enabledBorder: AuthStyle.kNoBorder,
            ),
          ),
        ),
      );

  Widget button(BuildContext context, Size size) => Button(
        width: size.width - kDefaultPadding * 2,
        text: 'Submit',
        backgroundColor: kPrimaryColor,
        press: () => onSubmitClicked(),
        disabled: disabled ? false : true,
      );

  Widget footer(Size size) => Positioned(
        bottom: 0,
        right: 0,
        child: SizedBox(height: 50, width: size.width, child: signIn()),
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
            child: Text(' Sign in', style: AuthStyle.kLightThemeBoldTextStyle),
          ),
        ],
      );
}
