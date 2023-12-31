import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:world_commerce/presentation/pages/signup/custom_widgets/input_text.dart';
import 'package:world_commerce/presentation/pages/signin/signin.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

import '../../../Services/auth_service.dart';
import '../../resources/strings_manager.dart';
import '../custom_product/span_text.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      StringsManager.needHelp,
                      style: TextStyle(
                          color: ColorManager.grey,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  StringsManager.start,
                  style: TextStyle(
                      color: ColorManager.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  StringsManager.signupAndContinue,
                  style: TextStyle(color: ColorManager.grey, fontSize: 15),
                ),
                const SizedBox(height: 20),
                InputText(
                  controller: emailController,
                  labelText: StringsManager.email,
                  icon: Icons.email_outlined,
                  hintText: 'nehal@email.com',
                  isPassword: false,
                ),
                InputText(
                  controller: nameController,
                  labelText: StringsManager.username,
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
                InputText(
                  controller: phoneController,
                  labelText: StringsManager.phone,
                  icon: Icons.person_outline,
                  hintText: 'Phone',
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    context.read<SignUpBloc>().add(SignupEv(
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                        username: nameController.text));
                    // await SingUpRepo().singUp(emailController.text, passwordController.text, phoneController.text, nameController.text);
                  },
                  child: BlocListener<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      if (state.loadingStatus == SignUpStatus.loaded) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => Signin(
                              isRegisteredSuccess: true,
                            ),
                          ),
                        );
                      } else if (state.loadingStatus == SignUpStatus.error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AuthService.errMsg!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: MediaQuery.of(context).size.width * .80,
                      height: 45,
                      decoration: const BoxDecoration(
                          color: ColorManager.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child:
                            context.watch<SignUpBloc>().state.loadingStatus ==
                                    SignUpStatus.loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    StringsManager.signup,
                                    style: TextStyle(color: Colors.white),
                                  ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringsManager.alreadyHaveAnAccount,
                      style: TextStyle(color: ColorManager.grey, fontSize: 14),
                    ),
                    const SizedBox(width: 3.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Signin(
                              isRegisteredSuccess: false,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        StringsManager.signin,
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                spanText(
                    context,
                    StringsManager.byConnectingYouAgree,
                    StringsManager.termsAndCondition,
                    ColorManager.black,
                    ColorManager.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
