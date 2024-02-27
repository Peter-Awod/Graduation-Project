import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/modules/home_screen/doctor_chat_screen/doctor_chat_screen.dart';
import 'package:grad_project/modules/home_screen/life_skills_screen/life_skills_screen.dart';
import 'package:grad_project/modules/home_screen/games_screen/games_screen.dart';
import 'package:grad_project/modules/settings_page/settings_screen.dart';
import 'package:grad_project/modules/settings_page/user_information/user_information_screen.dart';
import 'package:grad_project/shared/components/components.dart';

import 'package:grad_project/shared/cubit/cubit.dart';
import 'package:grad_project/shared/cubit/states.dart';
import 'package:grad_project/shared/local/cache_helper.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context ,states){},
        builder: (context ,states){

          AppCubit varCubit=AppCubit.get(context);

          int? userId =CacheHelper.getUserID(key: 'userID');

          var userData ;

          return Scaffold(
            backgroundColor: Colors.teal[600],
            appBar: AppBar(
                backgroundColor: Colors.teal[900],
                leading: IconButton(
                  icon: Icon(Icons.menu_outlined),
                  onPressed: () {},
                ),
                title: Text('PNA'),
                actions: [
                  IconButton(
                    icon: Icon(Icons.account_circle_outlined),
                    onPressed: (){

                      varCubit.getUserInformation( userId: userId!);
                      userData= varCubit.userData;

                      pushNavigateTo(context, UserInformation(userData: userData,));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings_outlined),
                    onPressed: () {
                      pushNavigateTo(context, SettingsScreen());
                    },
                  ),


                ]
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // top image
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade900,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 10,
                          color: Colors.teal.shade900,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: Image(
                          image: AssetImage('assets/images/login_pic.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // middle text
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        'Our Services',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,//common FontWeight
                          fontSize: 50,
                          color: Colors.white54, //must change
                        ),
                      ),
                    ),

                    // column have two rows to put navigation buttons
                    Column(
                      children: [
                        // first row
                        Row(
                          children: [
                            //Games
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  pushNavigateTo(context, GamesScreen());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.teal[800],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Image(
                                          image:
                                          AssetImage('assets/images/home_games2.png'),
                                        ),
                                      ),
                                      SizedBox(height: 5, ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.only(
                                          bottom: 5,
                                        ),
                                        child: Text(
                                          'GAMES',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white70, //must change
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 20,),
                            //Doctor
                            Expanded(
                              child: GestureDetector(
                                onTap: ()
                                {
                                  pushNavigateTo(context, DoctorChatScreen());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.teal[800],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.only(
                                                start: 10,
                                              ),
                                              child: Container(
                                                width: 70,
                                                child: Text(
                                                  'CHAT WITH DOCTOR',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white70, //must change

                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional.only(
                                                  end: 10,
                                                  top: 5,

                                                ),
                                                child: Image(
                                                  image:
                                                  AssetImage('assets/images/home_doctor.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5, ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),


                        SizedBox(height: 20, ),


                        // Second row
                        Row(
                          children: [
                            // Detection
                            Expanded(
                              child: GestureDetector(
                                onTap: ()
                                {
                                  // Navigator.push(context,
                                  //   MaterialPageRoute(builder: (context)=>AutismDetectionScreen()
                                  //   ),
                                  // );
                                  defaultSnackBarMessage(
                                      BuildContext: context,
                                    duration: 5,
                                    message: 'This feature is not available for now',
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.teal[800],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),

                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Image(
                                          image:
                                          AssetImage('assets/images/home_detection.png'),
                                        ),
                                      ),
                                      SizedBox(width: 5, ),
                                      Container(
                                        width: 100,
                                        child: Text(
                                          'DETECT AUTISM USING AI',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white70, //must change

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 10,),
                            //Life skills
                            GestureDetector(
                              onTap: ()
                              {
                                pushNavigateTo(context, LifeSkillsScreen());
                              },
                              child: Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.teal[800],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Image(
                                  image:
                                  AssetImage('assets/images/home_life_skills.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
