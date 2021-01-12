import 'package:cargic_user/helpers/authentication_helper.dart';
import 'package:cargic_user/models/back_end_model/user_model.dart';
import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/screens/payment_screens/cards_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/cargic_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'ProfileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthHelper _authHelper = AuthHelper();
  UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    String name = Provider.of<AppData>(context, listen: false).userName;
    String phone = Provider.of<AppData>(context, listen: false).userPhone;
    String email = Provider.of<AppData>(context, listen: false).userEmail;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODOchange to stream builder
            CargicUserProfileCard(
              userImage:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaj0ucKVpTNbey2YUj2f0V_MDQ1G6jBiwt2w&usqp=CAU',
              userName: (name != null) ? name : "",
              userPhone: (phone != null) ? phone : "",
              userEmail: (email != null) ? email : "",
            ),

            SizedBox(height: 34.5),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(CardScreen.id);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 15.5),
                decoration: BoxDecoration(
                  color: CargicColors.plainWhite,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: CargicColors.cosmicShadow,
                      blurRadius: 9.0,
                      offset: Offset(0.0, 6.0),
                    ),
                  ],
                ),
                child: Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 18.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
