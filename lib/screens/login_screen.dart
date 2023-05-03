import 'package:flutter/material.dart';
import 'package:ratq_appp/screens/authentication_service.dart';
import 'package:ratq_appp/screens/forgotpassword.dart';
import 'package:ratq_appp/screens/home_screen.dart';
import 'package:ratq_appp/screens/signup.dart';

class logInScreen extends StatefulWidget {
  const logInScreen({super.key});

  @override
  State<logInScreen> createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {
  late String email;
  late String password;
  final _authenticationService = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        titleTextStyle: const TextStyle(
            color: Color(0xffeaece1),
            fontWeight: FontWeight.bold,
            fontSize: 20),
        backgroundColor: Color(0xff8DB792),
        toolbarHeight: 70,
        leading: IconButton(
          iconSize: 15,
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xffeaece1),
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffEAECE1),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //اجرب هذا جديدmainAxisAlignment: MainAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text
              const Center(
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 50), //مسافه بين كلمة ساين اب و التكست فيلد

              //text feild

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 29, vertical: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your email',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 29, vertical: 1),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your password',
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // button
              Center(
                child: MaterialButton(
                  elevation: 5.0,
                  color: const Color(0xff8DB792),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () async {
                    try {
                      String? result = await _authenticationService
                          .loginWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (result != null) {
                        print(result);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return homeScreen();
                            },
                          ),
                        );
                      }
                      final user = await _authenticationService.getUser();
                      print(user!.email);
                      print(user.lastName);
                      print(user.firstName);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      color: Color.fromRGBO(234, 236, 225, 0.85),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //fogot password

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const Password();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Forget the Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const signUpScreen();
                  }));
                },
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
