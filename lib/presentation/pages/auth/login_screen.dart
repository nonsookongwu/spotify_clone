import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dartz/dartz.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/data/models/validator.dart';
import 'package:spotify_app/domain/usecases/auth/sign_up.dart';
import 'package:spotify_app/presentation/bloc/isLogin_cubit.dart';
import 'package:spotify_app/presentation/bloc/theme_cubit.dart';
import 'package:spotify_app/presentation/pages/auth/register_screen.dart';
import 'package:spotify_app/presentation/pages/home/homePage.dart';
import 'package:spotify_app/presentation/widget/custom_IconButton.dart';
import 'package:spotify_app/presentation/widget/custom_appBar.dart';
import 'package:spotify_app/presentation/widget/custom_button.dart';
import 'package:spotify_app/presentation/widget/custom_text_button.dart';
import 'package:spotify_app/service_locator.dart';
import 'package:dartz/dartz.dart' hide State;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHiddden = true;
  // bool isLogin = context.read<IsloginCubit>().updateIsLogin(isLogin);

  final _formKey = GlobalKey<FormState>();
  String _enteredEmail = "";
  String _enteredPassword = "";
  String _enteredFullName = "";
  bool isloading = false;

  void _handleHidePassword() {
    setState(() {
      isPasswordHiddden = !isPasswordHiddden;
    });
  }

  void _handleAuthToggle() {
    // setState(() {
    //   isLogin = !isLogin;
    // });
    context.read<IsloginCubit>().updateIsLogin();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // content: Text(message, style: TextStyle(color: Colors.black)),
        content: Text(message, style: Theme.of(context).textTheme.bodySmall),
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleFormSubmit() async {
    final isValid = _formKey.currentState!.validate();
    final isLogin = context.read<IsloginCubit>();

    if (isValid) {
      _formKey.currentState!.save();

      if (isLogin.state) {
        setState(() {
          isloading = true;
        });
        final result = await sl<SignInUseCase>().executeFunction(
          params: LoginUserReq(
            email: _enteredEmail,
            password: _enteredPassword,
          ),
        );
        setState(() {
          isloading = false;
        });
        result.fold(
          (l) {
            // print(l);
            _showSnackBar(l);
          },
          (r) {
            // print(r);
            _showSnackBar(r);
            _formKey.currentState!.reset();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=> Homepage()), (route) => false,);
          },
        );
      } else {
        setState(() {
          isloading = true;
        });
        final result = await sl<SignUpUseCase>().executeFunction(
          params: CreateUserReq(
            email: _enteredEmail,
            password: _enteredPassword,
            fullname: _enteredFullName,
          ),
        );
        setState(() {
          isloading = false;
        });
        result.fold(
          (l) {
            // print(l);
            _showSnackBar(l);
          },
          (r) {
            // print(r);
            _showSnackBar(r);
            _formKey.currentState!.reset();
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=> RootPage()), (route) => false,);
            _handleAuthToggle();
          },
        );
      }
    }

    // print(_enteredEmail);
    // print(_enteredFullName);
    // print(_enteredPassword);
    // print(isLogin.state);
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeCubit>().state;
    final isDark = currentTheme == ThemeMode.dark;
    return Scaffold(
      appBar: CustomAppbar(),
      body: Center(
        child: BlocBuilder<IsloginCubit, bool>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 30, 28, 30),
                // padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 60),
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state ? "Sign In" : "Register",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "If you need any support ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Click Here",
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!state)
                            TextFormField(
                              style: Theme.of(context).textTheme.bodyMedium,
                              keyboardType: TextInputType.name,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration(
                                hintText: "Full name",
                                // labelText: "Full Name",
                                labelStyle: Theme.of(
                                  context,
                                ).textTheme.bodyMedium,
                              ),
                              validator: Validation.validateUserName,
                              onSaved: (newValue) {
                                _enteredFullName = newValue!;
                              },
                            ),
                          TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            decoration: InputDecoration(
                              // labelText: "Username or Email",
                              hintText: "Username or Email",
                              labelStyle: Theme.of(
                                context,
                              ).textTheme.bodyMedium,
                            ),
                            validator: Validation.validateEmail,
                            onSaved: (newValue) {
                              _enteredEmail = newValue!;
                            },
                          ),
                          TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              // labelText: "Password",
                              hintText: "Password",
                              labelStyle: Theme.of(
                                context,
                              ).textTheme.bodyMedium,
                              suffixIcon: IconButton(
                                onPressed: _handleHidePassword,
                                icon: Icon(
                                  isPasswordHiddden
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                ),
                              ),
                            ),
                            obscureText: isPasswordHiddden ? true : false,
                            validator: Validation.validatePassword,
                            onSaved: (newValue) {
                              _enteredPassword = newValue!;
                            },
                          ),

                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Recovery password",
                              style: Theme.of(context).textTheme.titleSmall,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2),
                    CustomButton(
                      onPressed: _handleFormSubmit,
                      title: state ? "Sign In" : "Create Account",
                      isLoading: isloading,
                    ),
                    // SizedBox(height: 30),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: Container(
                            height: 2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: isDark
                                    ? [Color(0xff5B5B5B), Color(0xff252525)]
                                    : [Color(0xffB0B0B0), Color(0xffD3D3D3)],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Or",
                          style: Theme.of(context).textTheme.titleSmall,
                          // textAlign: TextAlign.left,
                        ),
                        Expanded(
                          child: Container(
                            height: 2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: isDark
                                    ? [Color(0xff252525), Color(0xff5B5B5B)]
                                    : [Color(0xffD3D3D3), Color(0xffB0B0B0)],
                              ),
                            ),
                          ),
                          // child: SvgPicture.asset(AppVectors.leftDivider),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 60,
                      children: [
                        CustomIconButton(
                          svgPath: AppVectors.googleIcon,
                          onPressed: () {},
                        ),
                        CustomIconButton(
                          svgPath: AppVectors.appleIcon,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not a Member ? ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        GestureDetector(
                          onTap: _handleAuthToggle,
                          child: Text(
                            state ? "Register Now." : "Sign In.",
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
