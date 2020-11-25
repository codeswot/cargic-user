import 'package:cargic_user/helpers/authentication_helper.dart';
import 'package:cargic_user/screens/auth_screens/login_with_email_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/brand_logo.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:cargic_user/widgets/sweet_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'RegisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthHelper _authHelper = AuthHelper();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              BrandLogo(),
              Container(
                margin: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                ),
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
                      iconColor: CargicColors.rageRed,
                      buttonColor: CargicColors.plainWhite,
                      buttonIcon: 'images/google_icon.svg',
                      title: 'Create with Google',
                      onPressed: () {
                        _authHelper.signInWithGoogle();
                        print('google');
                      },
                    ),
                    SizedBox(height: 21.0),
                    SweetTextField(
                      controller: _emailController,
                      obsecureText: false,
                      leadingIcon: Icons.email,
                      hintText: 'Email',
                    ),
                    SizedBox(height: 20),
                    SweetTextField(
                      controller: _passwordController,
                      obsecureText: true,
                      leadingIcon: Icons.lock,
                      trailinIcon: Icons.visibility,
                      hintText: 'Password',
                    ),
                    SizedBox(height: 20),
                    SweetTextField(
                      obsecureText: true,
                      leadingIcon: Icons.lock,
                      trailinIcon: Icons.visibility,
                      hintText: 'Confirm Password',
                    ),
                    SizedBox(height: 25.5),
                    CandyButton(
                      buttonColor: CargicColors.hopeBlue,
                      titleColor: CargicColors.plainWhite,
                      title: 'Create',
                      onPressed: () {
                        _authHelper.regsterUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .popAndPushNamed(LoginWithEmailScreen.id);
                },
                child: Container(
                  child: Text(
                    'Have an account ? login',
                    style: TextStyle(
                      color: CargicColors.smoothGray,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
