import 'package:cargic_user/helpers/authentication_helper.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/screens/register_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/brand_logo.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:cargic_user/widgets/sweet_text_field.dart';
import 'package:flutter/material.dart';

class LoginWithEmailScreen extends StatelessWidget {
  static const String id = 'LoginWithEmailScreen';

  @override
  Widget build(BuildContext context) {
    AuthHelper _authHelper = AuthHelper();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                BrandLogo(),
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
                      SweetTextField(
                        controller: _emailController,
                        obsecureText: false,
                        hintText: 'Email',
                        leadingIcon: Icons.email,
                        // trailinIcon: Icons.add,
                      ),
                      SizedBox(height: 20),
                      SweetTextField(
                        controller: _passwordController,
                        obsecureText: true,
                        hintText: 'Password',
                        leadingIcon: Icons.lock,
                        trailinIcon: Icons.visibility,
                      ),
                      SizedBox(height: 16.5),
                      InkWell(
                        onTap: () {
                          _authHelper.loginUser(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: CargicColors.smoothGray,
                            decoration: TextDecoration.underline,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 18.5),
                      CandyButton(
                        buttonColor: CargicColors.hopeBlue,
                        titleColor: CargicColors.plainWhite,
                        title: 'Login',
                        onPressed: () {
                          // _authHelper.loginUser(
                          //     email: _emailController.text,
                          //     password: _passwordController.text);
                          //For the now
                          Navigator.of(context).pushNamed(NavigationScreen.id);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed(RegisterScreen.id);
                  },
                  child: Container(
                    child: Text(
                      'CREATE AN ACCOUNT',
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
      ),
    );
  }
}
