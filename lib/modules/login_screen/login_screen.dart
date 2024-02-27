import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/shared/components/components.dart';

import 'package:grad_project/model/class_helper.dart';
import 'package:grad_project/modules/sign_up_screen/sign_up_screen.dart';
import 'package:grad_project/shared/cubit/cubit.dart';
import 'package:grad_project/shared/cubit/states.dart';
import 'package:hexcolor/hexcolor.dart';



class LoginScreen extends StatelessWidget  {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  late int storeId;





  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state)
        {
          AppCubit varCubit =AppCubit.get(context);


          return Scaffold(
            backgroundColor: Colors.teal[600],
            appBar: AppBar(
              backgroundColor: Colors.teal[900],
              automaticallyImplyLeading: false,
              title: Text('Login'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection:Axis.vertical,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Image(image: AssetImage('assets/images/login.png')),


                        SizedBox(
                          height: 20,
                        ),
                        //Text
                        Text(
                          'Welcome back',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                              color: Colors.white54
                          ),
                        ),

                        SizedBox(height: 20,),
                        // Email field
                        defaultTextFormField(
                          type: TextInputType.emailAddress,
                          label: 'Email',
                          prefix: Icons.email_outlined,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if(!validateEmail(value))
                            {
                              return 'please enter valid email address';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _email = value!;
                          },
                        ),
                        SizedBox(height: 10,),
                        // Password field
                        defaultTextFormField(
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          obsecuredText: varCubit.isPasswordHide,
                          suffix: varCubit.isPasswordHide
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixPressed: () {
                            varCubit.changePasswordIconState(varCubit.isPasswordHide);
                          },
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _password = value!;
                          },
                        ),
                        SizedBox(height: 20,),
                        // Login Button       //////////////////////
                        Container(
                          width: 350,
                          height: 50,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal[200], //must change
                              elevation: 15,

                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final user=User(  email: _email,password: _password);
                                varCubit.loginUser(BuildContext: context , logUser:user,context: context);
                              }
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                color: Colors.white54, //must change
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        //////////////////////////////////////////////////////////////


                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Don\'t have an account?',
                              style: TextStyle(
                                color: Colors.white54, //must change
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                pushNavigateTo(context, SignUpScreen());
                              },
                              child: Text(
                                'Register now',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('#070929'),
                                ),
                              ),
                            )
                          ],
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

  validateEmail(String validEmailAddress)
  {
    final emailReg =new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    );
    return emailReg.hasMatch(validEmailAddress);
  }




}
