import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/modules/settings_page/user_information/update_user_information/update_user_info_screen.dart';
import 'package:grad_project/modules/start_screen/start_screen.dart';
import 'package:grad_project/shared/components/components.dart';
import 'package:grad_project/shared/cubit/cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project/shared/cubit/states.dart';
import 'package:grad_project/shared/local/cache_helper.dart';
import 'package:hexcolor/hexcolor.dart';

class UserInformation extends StatelessWidget {
  late var userData;

  UserInformation({required this.userData});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>
      (
        listener: (context,state){},
        builder: (context,state){
          AppCubit varCubit=AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.teal[600],
            appBar: AppBar(
              backgroundColor: Colors.teal[900],
              title: Text('User information'),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
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
                        color: Colors.teal[200],
                        child: ListTile(
                          leading: Icon(Icons.account_circle_outlined,
                              size: 30,
                            color: HexColor('#070929'),
                          ),
                          title: Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                    color: HexColor('#070929'), //must change
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    '${userData[0]['name']}',
                                  style: TextStyle(
                                    color: HexColor('#070929'),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Email Card
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20,
                        end: 20,
                        top: 20,
                      ),
                      child: Card(
                        color: Colors.teal[200],
                        child: ListTile(
                          leading: Icon(Icons.email_outlined,
                              size: 30,
                            color: HexColor('#070929'),
                          ),
                          title: Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    color: HexColor('#070929'), //must change
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    '${userData[0]['email']}',
                                  style: TextStyle(
                                    color: HexColor('#070929'),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Phone Card
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20,
                        end: 20,
                        top: 20,
                      ),
                      child: Card(
                        color: Colors.teal[200],
                        child: ListTile(
                          leading: Icon(Icons.phone_iphone_outlined,
                              size: 30,
                            color: HexColor('#070929'),
                          ),
                          title: Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone',
                                  style: TextStyle(
                                    color: HexColor('#070929'), //must change
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    '${userData[0]['phone']}',
                                  style: TextStyle(
                                    color: HexColor('#070929'),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Birthday Card
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20,
                        end: 20,
                        top: 20,
                      ),
                      child: Card(
                        color: Colors.teal[200],
                        child: ListTile(
                          leading: Icon(Icons.calendar_month_outlined,
                              size: 30,
                            color: HexColor('#070929'),
                          ),
                          title: Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Birthday',
                                  style: TextStyle(
                                    color: HexColor('#070929'), //must change
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    '${userData[0]['birthday']}',
                                  style: TextStyle(
                                    color: HexColor('#070929'),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Gender Card
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20,
                        end: 20,
                        top: 20,
                      ),
                      child: Card(
                        color: Colors.teal[200],
                        child: ListTile(
                          leading: Icon(Icons.person_outline,
                              size: 30,
                            color: HexColor('#070929'),
                          ),
                          title: Padding(
                            padding: const EdgeInsetsDirectional.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gender',
                                  style: TextStyle(
                                    color: HexColor('#070929'), //must change
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    '${userData[0]['gender']}',
                                  style: TextStyle(
                                    color: HexColor('#070929'),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                    //update
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[200], //must change
                          elevation: 15,
                          fixedSize: Size(250, 50),
                        ),
                        onPressed: () {
                          varCubit.openUpdateScreen();
                          pushReplacementNavigateTo(context, UpdateUserInfoScreen(userData:userData));
                        },
                        child: Text('Update your information'),
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
            ),
          );
        },

    );
  }
}



