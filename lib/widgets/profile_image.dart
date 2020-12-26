import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
    @required this.profilePic,
  }) : super(key: key);

  final String profilePic;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: CargicColors.fearYellow,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage((profilePic != null) ? profilePic : ''),
          backgroundColor: CargicColors.brandBlue,
        ),
      ),
    );
  }
}
