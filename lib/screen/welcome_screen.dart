import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:state_management_app/pod/k_button.dart';
import 'package:state_management_app/screen/register_screen.dart';
import 'package:state_management_app/util/app_color.dart';
import '../util/assets_const.dart';
import '../util/dimension.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = '/';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MARGIN_MEDIUM * 5),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(cloudImage),
                  fit: BoxFit.fitWidth,
                ),),
              ),
            ),
            Positioned(
              top: MARGIN_MEDIUM_2 * 18.75,
              left: MARGIN_MEDIUM_2 * 2.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'Ready To Travel',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: MARGIN_MEDIUM_2,
                  ),
                  Text(
                    'Sign up with  Facebook for the most',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'fulfilling trip to planning experience with us.!',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
            Positioned(
              top: MARGIN_MEDIUM_2 * 32,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_2,
                ),
                child: Container(
                  height: MARGIN_MEDIUM_2 * 17,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Kbutton(
                        labelText: 'Log in with Facebook',
                        kButtonColor: AppColor().secondaryColor,
                        labelColor: AppColor().primaryColor,
                        icon: FontAwesomeIcons.facebookSquare,
                        onPressed: () {
                          print('Hello');
                        },
                      ),
                      Kbutton(
                        labelText: 'Log in with email address',
                        kButtonColor: AppColor().secondaryColor,
                        labelColor: AppColor().primaryColor,
                        onPressed: () {
                          print('Hello');
                        },
                      ),
                      Kbutton(
                        labelText: 'Create a new account',
                        gradient: AppColor().buttonGradientColor,
                        labelColor: AppColor().primaryColor,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          image: DecorationImage(
            image: AssetImage(welcomeImage),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
