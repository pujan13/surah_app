import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<Offset> _image1Animation, _image2Animation, _image3Animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _image1Animation = Tween<Offset>(begin: Offset(-1.5, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _image2Animation = Tween<Offset>(begin: Offset(0, 1.5), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _image3Animation = Tween<Offset>(begin: Offset(1.5, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.go('/videoPage'); // Navigation on successful login
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40),
                ),
              ),
            );
          }
        },
        child: Stack(
          children: [
            SlideTransition(
              position: _image1Animation,
              child: Image.asset(
                'assets/images/pic1.png',
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 1.35,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
            SlideTransition(
              position: _image2Animation,
              child: Image.asset(
                'assets/images/pic2.png',
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 1.35,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
            SlideTransition(
              position: _image3Animation,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/pic3.png',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 1.2,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTextField(
                      controller: _usernameController,
                      hintText: 'Username',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    _buildTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return CircularProgressIndicator();
                        }
                        return AnimatedButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  LoginButtonPressed(
                                    user_name: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: MediaQuery.of(context).size.height / 90,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.backgroundColor,
          fontSize: MediaQuery.of(context).size.height / 30,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.backgroundColor,
            fontSize: MediaQuery.of(context).size.height / 30,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height / 60,
            vertical: MediaQuery.of(context).size.height / 90,
          ),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AnimatedButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: MediaQuery.of(context).size.height / 5,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.backgroundColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.height / 60),
          ),
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 90,
            horizontal: MediaQuery.of(context).size.height / 60,
          ),
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
  }
}
