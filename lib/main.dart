import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/modules/login_screen/login_screen.dart';
import 'package:grad_project/modules/onboarding_screen/onboarding.dart';
import 'package:grad_project/modules/sign_up_screen/sign_up_screen.dart';
import 'package:grad_project/modules/start_screen/start_screen.dart';
import 'package:grad_project/shared/bloc_observer.dart';
import 'package:grad_project/model/provider_class.dart';
import 'package:grad_project/shared/cubit/cubit.dart';
import 'package:grad_project/shared/local/cache_helper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer=MyBlocObserver();
  await CacheHelper.init();

  runApp(
    MyApp(),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>AppCubit()..initializeDatabase()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
         theme: ThemeData(
             inputDecorationTheme: InputDecorationTheme(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15),
               )
             ),
         ),

          themeMode: ThemeMode.light,

          home:OnboardingScreen(),
        ),
    );
  }
}

