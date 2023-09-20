import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/Services/auth_service.dart';
import 'package:world_commerce/bloc/save_login/save_login_bloc.dart';

// import 'package:world_commerce/bloc/bloc/login_bloc.dart';
import 'package:world_commerce/presentation/pages/signup/custom_widgets/input_text.dart';
import 'package:world_commerce/presentation/pages/signup/signup.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';
import '../../../bloc/login_bloc/login_bloc.dart';

import '../../resources/strings_manager.dart';
import '../custom_product/span_text.dart';
import '../main/main.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        //Starting page

        body: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            margin: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //forget password leading to forget password page

                    Text(
                      StringsManager.forgotPassword,
                      style: TextStyle(
                          color: ColorManager.grey,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                //Welcome title
                const Text(
                  StringsManager.welcome,
                  style: TextStyle(
                      color: ColorManager.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  StringsManager.pleaseEnterData,
                  style: TextStyle(color: ColorManager.grey, fontSize: 15),
                ),
                const SizedBox(height: 20),
                //starting form email and password
                InputText(
                  controller: emailController,
                  labelText: StringsManager.email,
                  icon: Icons.person_outline,
                  hintText: 'nehalgamal',
                  isPassword: false,
                ),
                InputText(
                  controller: passwordController,
                  labelText: StringsManager.password,
                  icon: Icons.lock_outline,
                  hintText: '•••••••',
                  isPassword: true,
                ),
                //Remember me switch button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      StringsManager.rememberMe,
                      style: TextStyle(
                          color: ColorManager.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Switch(
                        activeTrackColor: ColorManager.green,
                        value: context
                                .watch<SaveLoginBloc>()
                                .state
                                .saveLoginStatus ==
                            SaveLoginStatus.save,
                        onChanged: (val) {
                          context.read<SaveLoginBloc>().add(SaveEvent());
                        }),
                  ],
                ),
                const SizedBox(height: 20),
                //Button for logging and accessing the home page if email & password are right
                // If Email and password not write it will show you snackbar with error message
                InkWell(
                  onTap: () async {
                    context.read<LoginBloc>().add(
                          Login(
                              email: emailController.text,
                              password: passwordController.text),
                        );
                    final saveStatus =
                        context.read<SaveLoginBloc>().state.saveLoginStatus;
                    if (saveStatus == SaveLoginStatus.save) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("email", emailController.text);
                    }
                  },
                  child: BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state.loadingStatus == LoginStatus.loaded) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const Main(),
                          ),
                        );
                      } else if (state.loadingStatus == LoginStatus.error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AuthService.errMsg,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                    //Button loading when waiting the request
                    // if there is an error the loading will stop and show snackbar with error message
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: width * .80,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: ColorManager.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: context.watch<LoginBloc>().state.loadingStatus ==
                                LoginStatus.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                StringsManager.login,
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                //Terms and conditions to read before logging in

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ),
                    );
                  },
                  child: spanText(context, 'Don\'t Have an Account? ',
                      'Sign Up', ColorManager.black, ColorManager.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
