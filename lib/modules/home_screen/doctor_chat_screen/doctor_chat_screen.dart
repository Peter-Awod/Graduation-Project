import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/modules/settings_page/user_information/user_information_screen.dart';
import 'package:grad_project/shared/components/components.dart';
import 'package:grad_project/shared/cubit/cubit.dart';
import 'package:grad_project/shared/cubit/states.dart';
import 'package:grad_project/shared/local/cache_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorChatScreen extends StatelessWidget {
  const DoctorChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit varCubit = AppCubit.get(context);

        int? userId = CacheHelper.getUserID(key: 'userID');
        var userData;

        return Scaffold(
          backgroundColor: Colors.teal[600],
          appBar: AppBar(
            backgroundColor: Colors.teal[900],
            title: Text('Doctor chat'),
            actions: [
              IconButton(
                onPressed: () {
                  varCubit.getUserInformation(userId: userId!);
                  userData = varCubit.userData;

                  pushReplacementNavigateTo(context, UserInformation(
                    userData: userData,
                  ));
                },
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // main container to hold doctor chat
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal[500],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile picture
                        Container(
                          padding: const EdgeInsetsDirectional.only(
                            start: 10,
                            top: 20,
                            end: 10,
                          ),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                'https://ichef.bbci.co.uk/news/976/cpsprodpb/15951/production/_117310488_16.jpg'),
                          ),
                        ),

                        //Column for name and chat
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // Profile name
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Dr: Mohamed Hussien Elsheikh',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#070929'),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              // Information
                              Row(
                                children: [
                                  //chat
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 5),
                                      child: Text(
                                        'Consultant of psychiatry and addiction treatment',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Specialization
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.psychology_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ),
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'Psychiatrist \n'
                                      'Specialized in Adult Psychiatry, Addiction, Toxicology'
                                      'and Adolescent Psychiatry',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Location
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'El-Mohandessin: Abdel Mona-em reyad',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Price
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.attach_money_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'Fees: 400 EGP',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Waiting time
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.watch_later_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'Waiting time: 1 Hour and 31 Minutes',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Contact
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.add_ic_call_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      '16676-Cost of regular call',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Navigation buttons
                              SizedBox(
                                height: 5,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  launch(
                                      'https://www.vezeeta.com/en/dr/doctor-mohamed-hussien-el-sheikh-psychiatry-1');
                                },
                                child: Card(
                                  color: Colors.teal[200],
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Reserve appointment',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Second doctor
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal[500],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile picture
                        Container(
                          padding: const EdgeInsetsDirectional.only(
                            start: 10,
                            top: 20,
                            end: 10,
                          ),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                'https://ichef.bbci.co.uk/news/976/cpsprodpb/15951/production/_117310488_16.jpg'),
                          ),
                        ),

                        //Column for name and chat
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // Profile name
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Dr: Sally mohamed el sheikh',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#070929'),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              // Information
                              Row(
                                children: [
                                  //chat
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 5),
                                      child: Text(
                                        'Consultant Psychiatrist marriage&family counselor Addiction Treatment',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Specilization
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.psychology_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ),
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'Psychiatrist \n'
                                      'Specialized in Family Counseling, Addiction, Pediatric Psychiatry, '
                                      'Adult Psychiatry, Adolescent Psychiatry, Pediatric Neurology, '
                                      'Adult Neurology and Toxicology',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Location
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'El-Dokki : 53 Amman Street beside Shooting Club Dokki',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Price
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.attach_money_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'Fees: 750 EGP',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Waiting time
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.watch_later_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'Waiting time: 1 Hour and 30 Minutes',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Contact
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.add_ic_call_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      '16676-Cost of regular call',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Navigation buttons
                              SizedBox(
                                height: 5,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  launch(
                                      'https://www.vezeeta.com/en/dr/Doctor-Sally-Mohamed-El-Sheikh-Psychiatry-1');
                                },
                                child: Card(
                                  color: Colors.teal[200],
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Reserve appointment',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Third doctor
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal[500],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile picture
                        Container(
                          padding: const EdgeInsetsDirectional.only(
                            start: 10,
                            top: 20,
                            end: 10,
                          ),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                'https://ichef.bbci.co.uk/news/976/cpsprodpb/15951/production/_117310488_16.jpg'),
                          ),
                        ),

                        //Column for name and chat
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // Profile name
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Dr: Atef Elsayed abo farag',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#070929'),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              // Information
                              Row(
                                children: [
                                  //chat
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 5),
                                      child: Text(
                                        'consultant of psychiatry and neurology',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Specilization
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.psychology_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ),
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'Psychiatrist \n'
                                      'Specialized in  Pediatric Neurology, Adult Neurology, Pediatric Psychiatry, '
                                      'Adult Psychiatry, Adolescent Psychiatry, Family Counseling and Addiction',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Location
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'Mahalla : Talat harb _ borg el delta',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Price
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.attach_money_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'Fees: 200 EGP',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Waiting time
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.watch_later_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      'Waiting time: 1 Hour and 30 Minutes',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Contact
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      end: 5,
                                    ),
                                    child: Icon(
                                      Icons.add_ic_call_outlined,
                                      color: HexColor('#070929'),
                                      size: 30,
                                    ),
                                  ), //must change
                                  //chat
                                  Expanded(
                                    child: Text(
                                      '16676-Cost of regular call',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Navigation buttons
                              SizedBox(
                                height: 5,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  launch(
                                      'https://www.vezeeta.com/en/dr/Doctor-Sally-Mohamed-El-Sheikh-Psychiatry-1');
                                },
                                child: Card(
                                  color: Colors.teal[200],
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Reserve appointment',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
