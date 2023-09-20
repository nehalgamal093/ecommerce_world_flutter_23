import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_commerce/bloc/save_login/save_login_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:world_commerce/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:world_commerce/presentation/pages/main/main.dart';
import 'package:world_commerce/presentation/pages/signin/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_commerce/repository/login_repo.dart';
import 'package:world_commerce/repository/signup_repo.dart';

import 'bloc/login_bloc/login_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dotenv.load(fileName: '.env');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(
            loginRepo: LoginRepo(),
          ),
        ),
        BlocProvider(
          create: (_) => SaveLoginBloc(),
        ),
        BlocProvider(
          create: (_) => SignUpBloc(
            singUpRepo: SingUpRepo(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: email == null ? Signin() : const Main(),
      ),
    ),
  );
}
