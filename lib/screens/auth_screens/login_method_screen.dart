import 'package:cargic_user/helpers/authentication_helper.dart';
import 'package:cargic_user/screens/auth_screens/login_with_email_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/brand_logo.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:flutter/material.dart';

class LoginMethodScreen extends StatelessWidget {
  static const String id = 'LoginMethodScreen';
  @override
  Widget build(BuildContext context) {
    AuthHelper _authHelper = AuthHelper();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BrandLogo(),
            Container(
              margin: EdgeInsets.only(left: 49.5, right: 49.5),
              child: Text(
                'By login to our service your data will be saved and accessible from different devices',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              padding: EdgeInsets.only(
                left: 27.0,
                right: 27.0,
                top: 52.0,
                bottom: 52.0,
              ),
              decoration: BoxDecoration(
                color: CargicColors.plainWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8.0,
                    offset: Offset(0, 4.0),
                    color: CargicColors.cosmicShadow,
                  ),
                ],
              ),
              child: Column(
                children: [
                  CandyButton(
                    buttonColor: CargicColors.plainWhite,
                    titleColor: CargicColors.smoothGray,
                    iconColor: CargicColors.rageRed,
                    buttonIcon: 'images/google_icon.svg',
                    title: 'Login with Google',
                    onPressed: () {
                      _authHelper.signInWithGoogle();
                    },
                  ),
                  SizedBox(height: 32.0),
                  CandyButton(
                    buttonColor: CargicColors.hopeBlue,
                    titleColor: CargicColors.plainWhite,
                    iconColor: CargicColors.plainWhite,
                    buttonIcon: 'images/email_icon.svg',
                    title: 'Login with Email',
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginWithEmailScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
