import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/signup/custom_widgets/input_text.dart';
import 'package:world_commerce/presentation/pages/signin/signin.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

import '../../resources/strings_manager.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
                const SizedBox(height: 30),
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
                const InputText(
                  labelText: StringsManager.email,
                  icon: Icons.email_outlined,
                  hintText: 'nehal@email.com',
                  isPassword: false,
                ),
                const InputText(
                  labelText: StringsManager.username,
                  icon: Icons.person_outline,
                  hintText: 'nehalgamal',
                  isPassword: false,
                ),
                const InputText(
                  labelText: StringsManager.password,
                  icon: Icons.lock_outline,
                  hintText: '•••••••',
                  isPassword: true,
                ),
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
                        value: true,
                        onChanged: (val) {}),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * .80,
                  height: 45,
                  decoration: const BoxDecoration(
                      color: ColorManager.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      StringsManager.signup,
                      style: TextStyle(color: Colors.white),
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
                    const  SizedBox(width: 3.0),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signin()));
                      },
                      child:  const Text(
                        StringsManager.signin,
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
