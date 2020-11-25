import 'package:cargic_user/widgets/ninja_card.dart';
import 'package:flutter/material.dart';

class NinjaScreen extends StatelessWidget {
  static const String id = 'NinjaScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            //list view.builder!
            children: [
              SizedBox(height: 15), //
              NinjaCard(
                ninjaImage:
                    'https://media.istockphoto.com/photos/mechanic-holding-tools-picture-id502423025?k=6&m=502423025&s=612x612&w=0&h=A0KcriQYfA8h15t6q8rkSoAclBtaHG0GFhBnVpDcnqA=',
                ninjaName: 'Musa Damusa',
                ninjaState: 'Zaria',
                ninjaProfession: 'Professional Car Service',
                ninjaRating: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
