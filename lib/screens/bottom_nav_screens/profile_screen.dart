import 'package:cargic_user/helpers/authentication_helper.dart';
import 'package:cargic_user/screens/payment_screens/cards_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/cargic_profile_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'ProfileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthHelper _authHelper = AuthHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODOchange to stream builder
            FutureBuilder(
              future: _authHelper.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 100),
                    child: CircularProgressIndicator(
                      backgroundColor: CargicColors.brandBlue,
                    ),
                  );
                }
                return CargicUserProfileCard(
                  userImage:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaj0ucKVpTNbey2YUj2f0V_MDQ1G6jBiwt2w&usqp=CAU',
                  userName: snapshot.data['name'],
                  userPhone: snapshot.data['phone'],
                  userEmail: snapshot.data['email'],
                );
              },
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
