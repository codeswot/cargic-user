//profile card
import 'package:cargic_user/utils/cargic_icons_icons.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/cargic_profile_picture.dart';
import 'package:flutter/material.dart';

class CargicUserProfileCard extends StatelessWidget {
  const CargicUserProfileCard({
    Key key,
    this.userName,
    this.userImage,
    this.userPhone,
    this.userEmail,
  }) : super(key: key);
  final String userName;
  final String userImage;
  final String userPhone;
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(
        left: 88.0,
        right: 88.0,
        top: 23.5,
        bottom: 47.0,
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CargicProfilePic(image: (userImage != null) ? userImage : ''),
          SizedBox(height: 22.5),
          Text(
            (userName != null) ? userName : '',
            style: TextStyle(
                color: CargicColors.brandBlue,
                fontWeight: FontWeight.w600,
                fontSize: 15.5),
          ),
          SizedBox(height: 7.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CargicIcons.phone_icon,
                size: 16,
                color: CargicColors.brandBlue,
              ),
              SizedBox(width: 7.5),
              Text(
                (userPhone != null) ? userPhone : '',
                style: TextStyle(
                  color: CargicColors.brandBlue,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CargicIcons.email_icon,
                size: 15,
                color: CargicColors.brandBlue,
              ),
              SizedBox(width: 7.5),
              Text(
                (userEmail != null) ? userEmail : '',
                style: TextStyle(
                  color: CargicColors.brandBlue,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
