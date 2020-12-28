import 'package:cargic_user/helpers/authentication_helper.dart';
import 'package:cargic_user/utils/cargic_icons_icons.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/cargic_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CargicSideNav extends StatefulWidget {
  const CargicSideNav({
    Key key,
  }) : super(key: key);

  @override
  _CargicSideNavState createState() => _CargicSideNavState();
}

class _CargicSideNavState extends State<CargicSideNav> {
  AuthHelper _authHelper = AuthHelper();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        return Column(
                          children: [
                            CargicProfilePic(
                              image:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaj0ucKVpTNbey2YUj2f0V_MDQ1G6jBiwt2w&usqp=CAU',
                              width: 65,
                              height: 65,
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 120,
                              child: Text(
                                '${snapshot.data['name']}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: CargicColors.deludedGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 26),
                    CargicListTile(
                        icon: Icon(
                          CargicIcons.gift_icon,
                          color: CargicColors.smoothGray,
                          size: 19.0,
                        ),
                        title: 'Invite Friends'),
                    CargicListTile(
                        icon: Icon(
                          CargicIcons.contact_icon,
                          color: CargicColors.smoothGray,
                          size: 19.0,
                        ),
                        title: 'Contact Us'),
                    CargicListTile(
                        icon: SvgPicture.asset(
                          'images/brand_logo.svg',
                          width: 16,
                          height: 16,
                          color: CargicColors.smoothGray,
                        ),
                        title: 'About Us'),
                    CargicListTile(
                        icon: SvgPicture.asset(
                          'images/info_icon.svg',
                          width: 16.0,
                          height: 16.0,
                          color: CargicColors.smoothGray,
                        ),
                        title: 'FAQs'),
                    CargicListTile(
                        icon: SvgPicture.asset(
                          'images/accept.svg',
                          width: 21.0,
                          height: 21.0,
                          color: CargicColors.smoothGray,
                        ),
                        title: 'Terms and Conditions'),
                  ],
                ),
              ),
              Flexible(child: Container()),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(thickness: 2),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        CargicListTile(
                            icon: Icon(
                              Icons.settings,
                              color: CargicColors.smoothGray,
                              size: 22.0,
                            ),
                            title: 'Settings'),
                        CargicListTile(
                            icon: Icon(
                              Icons.exit_to_app,
                              color: CargicColors.smoothGray,
                              size: 22.0,
                            ),
                            title: 'Sign Out'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CargicListTile extends StatelessWidget {
  const CargicListTile({
    Key key,
    this.icon,
    this.title,
    this.onTap,
  }) : super(key: key);
  final Widget icon;
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 19.0),
        child: Row(
          children: [
            Container(
              child: (icon != null) ? icon : null,
            ),
            SizedBox(width: 17),
            Text(
              (title != null) ? title : '',
              style: TextStyle(
                color: CargicColors.fairGrey,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
