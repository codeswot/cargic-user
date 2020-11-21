import 'package:cargic_user/utils/cargic_icons_icons.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/cargic_profile_card.dart';
import 'package:cargic_user/widgets/cargic_profile_picture.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CargicUserProfileCard(
              userImage:
                  'https://avatars3.githubusercontent.com/u/40618838?s=460&v=4',
              userName: 'Mubarak Ibrahim',
              userPhone: '2340713113499',
              userEmail: 'elmubixy@geeksaxis.com',
            ),
            SizedBox(height: 34.5),
            GestureDetector(
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
