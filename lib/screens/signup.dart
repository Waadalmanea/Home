import 'package:flutter/material.dart';
import 'package:ratq_appp/screens/authentication_service.dart';
import 'package:ratq_appp/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _authenticationService = AuthenticationService();

  late String email;
  late String password;
  late String fname;
  late String lname;
  late String password_2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        titleTextStyle: const TextStyle(
            color: Color(0xffeaece1),
            fontWeight: FontWeight.bold,
            fontSize: 20),
        backgroundColor: const Color(0xff8DB792),
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
      backgroundColor: const Color(0xffEAECE1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 50), //مسافه بين كلمة ساين اب و التكست فيلد

              //text feild

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    onChanged: (value) {
                      fname = value;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your first name',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    onChanged: (value) {
                      lname = value;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your last name',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
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

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    onChanged: (value) {
                      password_2 = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your password again',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
// button
              MaterialButton(
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
                      String? result =
                          await _authenticationService.createNewUser(
                        email: email,
                        password: password,
                      );
                      if (result != null) {
                        String? logInResult = await _authenticationService
                            .loginWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        if (logInResult != null) {
                          await _authenticationService.addUserData(
                            firstName: fname,
                            lastName: lname,
                            email: email,
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return homeScreen();
                              },
                            ),
                          );
                        }
                      }
                      
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color.fromRGBO(234, 236, 225, 0.85),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
