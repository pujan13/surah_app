import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../video/video_page.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // Use GoRouter for navigation
            context.go('/VideoPage');
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height/40), // Adjust the font size
                ),
              ),
            );
          }
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              height: MediaQuery.of(context).size.height * 1.35,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset(
                'assets/images/pic1.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              height: MediaQuery.of(context).size.height * 1.35,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset(
                'assets/images/pic2.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height * 1.2,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(
                'assets/images/pic3.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: -40,
              top: -40,
              width: MediaQuery.of(context).size.width / 4,
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Image.asset(
                  'assets/images/logo/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: Positioned(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius:
                          BorderRadius.circular(12), // Border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26, // Shadow color
                              blurRadius: 10, // Soft blur effect
                              offset: Offset(0, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _usernameController,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: '',
                            fontWeight: FontWeight.w700,
                            color: AppColors.backgroundColor, // Input text color
                            fontSize: MediaQuery.of(context).size.height / 30,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.backgroundColor,
                              fontSize: MediaQuery.of(context).size.height / 30,
                            ),
                            border: InputBorder.none, // Remove default border
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.height/60, vertical: MediaQuery.of(context).size.height/90),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius:
                          BorderRadius.circular(MediaQuery.of(context).size.height/60), // Border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26, // Shadow color
                              blurRadius: MediaQuery.of(context).size.height/60, // Soft blur effect
                              offset: Offset(0, 5), // Shadow position
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _passwordController,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: '',
                            fontWeight: FontWeight.w700,
                            color: AppColors.backgroundColor, // Input text color
                            fontSize: MediaQuery.of(context).size.height / 30,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.backgroundColor,
                              fontSize: MediaQuery.of(context).size.height / 30,
                            ),
                            border: InputBorder.none, // Remove default border
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.height/60, vertical: MediaQuery.of(context).size.height/90),
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/50),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return CircularProgressIndicator();
                          }
                          return SizedBox(
                            width: MediaQuery.of(context).size.height/5, // Full-width button
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<LoginBloc>().add(
                                  LoginButtonPressed(
                                    user_name: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.whiteColor, // White button background
                                foregroundColor: AppColors.backgroundColor, // Text color
                                elevation: 5, // Adds shadow effect
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/60), // Rounded corners
                                ),
                                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/90,horizontal: MediaQuery.of(context).size.height/60), // Vertical padding
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height / 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
