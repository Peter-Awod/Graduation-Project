import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/model/class_helper.dart';
import 'package:grad_project/modules/settings_page/user_information/user_information_screen.dart';
import 'package:grad_project/shared/components/components.dart';

import 'package:grad_project/shared/cubit/cubit.dart';
import 'package:grad_project/shared/cubit/states.dart';
import 'package:grad_project/shared/local/cache_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';


class UpdateUserInfoScreen extends StatelessWidget
{
  late var userData;
  UpdateUserInfoScreen({required this.userData});
  final _formKey = GlobalKey<FormState>();

  // Declare variables for user information

  String? selectGender;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>
      (
        listener: (context,state){},
        builder: (context,state){

          AppCubit varCubit= AppCubit.get(context);
          int? currentUser =CacheHelper.getUserID(key: 'userID');

           TextEditingController usernameController=TextEditingController(text: userData[0]['name']);
           TextEditingController passwordController=TextEditingController(text: userData[0]['password']);
           TextEditingController emailController=TextEditingController(text: userData[0]['email']);
           TextEditingController phoneController=TextEditingController(text: userData[0]['phone']);
           TextEditingController birthdayController=TextEditingController(text: userData[0]['birthday']);
           TextEditingController genderController=TextEditingController(text: userData[0]['gender']);
          if(state is UpdateScreenOpenedState)
          {
            selectGender=userData[0]['gender'];
          }

          var updatedUserData ;


          return Scaffold(
            backgroundColor: Colors.teal[600],
            appBar: AppBar(
              backgroundColor: Colors.teal[900],
              title: Text('Update User Information'),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 100,
                    bottom: 30,
                    start: 20,
                    end: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Username input
                        defaultTextFormField(
                          controller: usernameController,

                          label: 'Username',
                          type: TextInputType.text,
                          prefix: Icons.account_circle_outlined,
                          onFieldSubmitted: (value) {
                            usernameController.text = value!;
                          } ,

                        ),
                        SizedBox(height: 16.0),


                        // Email input
                        defaultTextFormField(
                          controller: emailController,
                          onFieldSubmitted: (value) => emailController.text = value!,
                            label: 'Email',
                          type: TextInputType.emailAddress,
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(height: 16.0),

                        // Password input
                        defaultTextFormField(
                          controller: passwordController,
                          onFieldSubmitted: (value) => passwordController.text = value!,
                            label: 'Password',
                          type: TextInputType.visiblePassword,
                            prefix:Icons.lock_outline,
                        ),
                        SizedBox(height: 16.0),
                        // Phone input
                        defaultTextFormField(
                          controller: phoneController,
                          onFieldSubmitted: (value) => phoneController.text = value!,
                          type: TextInputType.number,
                            label: 'Phone',
                          prefix: Icons.phone_iphone_outlined,
                        ),
                        SizedBox(height: 16.0),

                        // Birthday input
                        defaultTextFormField(
                          controller: birthdayController,
                          onTap: () {
                            showDatePicker(context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.parse('1990-12-30'),
                              lastDate: DateTime.parse('2100-12-30'),
                            ).then(
                                    (value){
                                  birthdayController.text=DateFormat().add_yMMMd().format(value!);
                                }
                            );
                          } ,
                            label: 'Birthday',
                          type: TextInputType.datetime,
                          prefix: Icons.calendar_month_outlined,
                        ),
                        SizedBox(height: 16.0),


                        // gender
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.teal[700],
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: Colors.white54,
                              ),
                              vertical: BorderSide(
                                color: Colors.white54,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  'Select your gender',
                                  style: TextStyle(
                                    color: Colors.white54,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.teal[600],
                                    border: Border.symmetric(
                                      horizontal: BorderSide(
                                        color: Colors.white54,
                                      ),
                                      vertical: BorderSide(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                  child: RadioListTile(
                                    activeColor: HexColor('#070929'),
                                    title: Text(
                                      'Male',
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                    value: 'male',
                                    groupValue: selectGender,
                                    onChanged: (value) {
                                      varCubit.selectGender(value!);
                                      selectGender = value.toString();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.teal[600],
                                    border: Border.symmetric(
                                      horizontal: BorderSide(
                                        color: Colors.white54,
                                      ),
                                      vertical: BorderSide(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                  child: RadioListTile(
                                    activeColor: HexColor('#070929'),
                                    title: Text(
                                      'Female',
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                    value: 'female',
                                    groupValue: selectGender,
                                    onChanged: (value) {
                                      varCubit.selectGender(value!);
                                      selectGender = value.toString();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        // Update button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[200], //must change
                            elevation: 15,
                            fixedSize: Size(150, 50),
                          ),
                          onPressed: () async {
                            // Create a new User object with updated information
                            final updatedUser = User(
                              userId: currentUser!,
                              username: usernameController.text,
                              password: passwordController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              gender: selectGender!,
                              birthday: birthdayController.text,
                            );

                            userData=[{
                              'userId':updatedUser.userId,
                              'name': updatedUser.username,
                              'password': updatedUser.password,
                              'email': updatedUser.email,
                              'phone': updatedUser.phone,
                              'gender': updatedUser.gender,
                              'birthday': updatedUser.birthday,
                            }];
                            //print(updatedUser.birthday);
                            varCubit.updateUser(updatedUser:updatedUser);

                            varCubit.getUserInformation( userId: currentUser!);

                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserInformation(userData: userData)));
                          },
                          child: Text('Update'),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
    );
  }
}



