import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/modules/sign_up_screen/sign_up_screen.dart';
import 'package:grad_project/modules/start_screen/start_screen.dart';
import 'package:grad_project/shared/cubit/cubit.dart';
import 'package:grad_project/shared/cubit/states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit varCubit = AppCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.teal[600],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.teal[600],
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 200,
            ),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                if (varCubit.onBoardingIndexChange(index)) {
                  isLastPage = true;
                }
              },
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.teal[200],
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: double.infinity,

                            child: Image(
                              image: AssetImage('assets/images/start.png'),
                              fit: BoxFit.fitWidth,
                              width: double.infinity,

                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Welcome to Our App',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 35.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Discover amazing features',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.teal[200],
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: double.infinity,

                            child: Image(
                              image: AssetImage('assets/images/onboarding2-removebg-preview.png'),
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Chat with Specialists',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 35.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Get expert advice',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.teal[200],
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: double.infinity,

                            child: Image(
                              image: AssetImage('assets/images/onboarding3-removebg-preview.png'),
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Learning Made Fun',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 35.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Explore educational games',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),

          bottomSheet: ConditionalBuilder(
            condition: isLastPage,
            builder: (context) => TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
// primary: Colors.white54,
// backgroundColor: Colors.white54,
                  minimumSize: const Size.fromHeight(80.0)),
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.teal,
                ),
              ),
            ),
            fallback: (context) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 80,
              color: Colors.white54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: const Text(
                        'SKIP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.teal,
                        ),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.easeInOut),
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.teal,
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
