import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/modules/settings_page/help_and_support_screen.dart';
import 'package:grad_project/modules/settings_page/notification_screen.dart';
import 'package:grad_project/modules/settings_page/privacy_security_screen.dart';
import 'package:grad_project/modules/settings_page/user_information/user_information_screen.dart';
import 'package:grad_project/modules/start_screen/start_screen.dart';
import 'package:grad_project/shared/components/components.dart';
import 'package:grad_project/shared/cubit/cubit.dart';
import 'package:grad_project/shared/cubit/states.dart';
import 'package:grad_project/shared/local/cache_helper.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        int? userId = CacheHelper.getUserID(key: 'userID');

        AppCubit varCubit = AppCubit.get(context);
        var userData;

        return Scaffold(
          backgroundColor: Colors.teal[600],
          appBar: AppBar(
            backgroundColor: Colors.teal[900],
            title: Text('Settings'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Account Card

                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 20,
                    end: 20,
                    top: 20,
                  ),
                  child: Card(
                    color: Colors.teal[900],
                    child: TextButton(
                      onPressed: () {
                        varCubit.getUserInformation(userId: userId!);
                        userData = varCubit.userData;

                        pushNavigateTo(context, UserInformation(
                          userData: userData,
                        ));
                      },
                      child: ListTile(
                        leading: Icon(Icons.account_circle_outlined,
                            size: 30, color: Colors.white54),
                        title: Text(
                          'Account',
                          style: TextStyle(
                            color: Colors.white54, //must change
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            size: 30, color: Colors.white54),
                      ),
                    ),
                  ),
                ),

                //Notification Card
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 20,
                    end: 20,
                    top: 20,
                  ),
                  child: Card(
                    color: Colors.teal[900],
                    child: TextButton(
                      onPressed: () {
                        pushNavigateTo(context, NotificationScreen());
                      },
                      child: ListTile(
                        leading: Icon(Icons.notifications_outlined,
                            size: 30, color: Colors.white54),
                        title: Text(
                          'Notification',
                          style: TextStyle(
                            color: Colors.white54, //must change
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            size: 30, color: Colors.white54),
                      ),
                    ),
                  ),
                ),

                //Privacy & security
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 20,
                    end: 20,
                    top: 20,
                  ),
                  child: Card(
                    color: Colors.teal[900],
                    child: TextButton(
                      onPressed: () {
                        pushNavigateTo(context, PrivacyAndSecurityScreen());
                      },
                      child: ListTile(
                        leading: Icon(Icons.privacy_tip_outlined,
                            size: 30, color: Colors.white54),
                        title: Text(
                          'Privacy & security',
                          style: TextStyle(
                            color: Colors.white54, //must change
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            size: 30, color: Colors.white54),
                      ),
                    ),
                  ),
                ),

                //Help and support
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 20,
                    end: 20,
                    top: 20,
                    bottom: 100,
                  ),
                  child: Card(
                    color: Colors.teal[900],
                    child: TextButton(
                      onPressed: () {
                        pushNavigateTo(context, HelpAndSupportScreen());
                      },
                      child: ListTile(
                        leading: Icon(Icons.help_outline,
                            size: 30, color: Colors.white54),
                        title: Text(
                          'Help and support',
                          style: TextStyle(
                            color: Colors.white54, //must change
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            size: 30, color: Colors.white54),
                      ),
                    ),
                  ),
                ),

                //logout
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[200], //must change
                    elevation: 15,
                    fixedSize: Size(150, 50),
                  ),
                  onPressed: () {
                    CacheHelper.removeUserId(key: 'userID');
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartPageScreen(),
                      ),
                      (route) => false,
                    );

                    print('User Id ${CacheHelper.getUserID(key: 'userID')}');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_outlined,
                        color: HexColor('#070929'),
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white54, //must change
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
