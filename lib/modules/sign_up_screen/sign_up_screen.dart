import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/model/class_helper.dart';
import 'package:grad_project/shared/components/components.dart';

import 'package:grad_project/modules/login_screen/login_screen.dart';
import 'package:grad_project/shared/cubit/cubit.dart';
import 'package:grad_project/shared/cubit/states.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _password;
  late String _ConfirmPassword;
  late String _phone;
  String? _gender;
  late String _birthday;

  var birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit varCubit = AppCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.teal[600],
          appBar: AppBar(
            backgroundColor: Colors.teal[900],
            title: Text('Sign Up'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/images/register.png')),

                      SizedBox(
                        height: 20,
                      ),
                      //Text
                      Text(
                        'Register now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white54,
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      // User name
                      defaultTextFormField(
                        type: TextInputType.text,
                        label: 'Name',
                        prefix: Icons.person_outline,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _name = value!;
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // Email address
                      defaultTextFormField(
                        type: TextInputType.emailAddress,
                        label: 'Email',
                        prefix: Icons.email_outlined,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!validateEmail(value)) {
                            return 'please enter valid email address';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _email = value!;
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      // Phone
                      defaultTextFormField(
                        type: TextInputType.number,
                        label: 'Phone number',
                        prefix: Icons.phone_iphone_outlined,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _phone = value!;
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),

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
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    varCubit.selectGender(value!);
                                    _gender = value.toString();
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
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    varCubit.selectGender(value!);
                                    _gender = value.toString();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // Add birthday TextFormField

                      defaultTextFormField(
                        controller: birthdayController,
                        label: 'Birthday',
                        type: TextInputType.datetime,
                        prefix: Icons.calendar_today_outlined,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.parse('1990-12-30'),
                            lastDate: DateTime.parse('2100-12-30'),
                          ).then((value) {
                            _birthday = DateFormat().add_yMMMd().format(value!);
                            birthdayController.text =
                                DateFormat().add_yMMMd().format(value!);
                          });
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // User password
                      defaultTextFormField(
                        type: TextInputType.visiblePassword,
                        label: 'Password',
                        prefix: Icons.lock_outline,
                        obsecuredText: varCubit.isPasswordHide,
                        suffix: varCubit.isPasswordHide
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixPressed: () {
                          varCubit
                              .changePasswordIconState(varCubit.isPasswordHide);
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
                      SizedBox(
                        height: 10,
                      ),

                      // User confirm password
                      defaultTextFormField(
                        type: TextInputType.visiblePassword,
                        label: 'Confirm password',
                        prefix: Icons.lock_outline,
                        obsecuredText: varCubit.isConfirmPasswordHide,
                        suffix: varCubit.isConfirmPasswordHide
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixPressed: () {
                          varCubit.changeConfirmIconState(
                              varCubit.isConfirmPasswordHide);
                        },
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password again';
                          }
                          if (value.length < 6 || value != _password) {
                            return 'Password doesn\'t match';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _ConfirmPassword = value!;
                        },
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      // Sign up button
                      Container(
                        width: 350,
                        height: 50,
                        // decoration: BoxDecoration(
                        //   color: Colors.teal[900], //must change
                        //   borderRadius: BorderRadius.circular(15),
                        // ),

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[200], //must change
                            elevation: 15,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final user = User(
                                  username: _name,
                                  password: _password,
                                  email: _email,
                                  phone: _phone,
                                  gender: _gender.toString(),
                                  birthday: _birthday);
                              varCubit.insertUserToDatabase(user);
                              pushReplacementNavigateTo(context, LoginScreen());
                            }
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white54, //must change
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.white54, //must change
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              pushNavigateTo(context, LoginScreen());
                            },
                            child: Text(
                              'Login',
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

  validateEmail(String validEmailAddress) {
    final emailReg = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailReg.hasMatch(validEmailAddress);
  }
}
