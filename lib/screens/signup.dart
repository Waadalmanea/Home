import 'package:flutter/material.dart';
import 'package:ratq_appp/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  late String fname;
  late String lname;
  late String password_2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        titleTextStyle: TextStyle(
            color: Color(0xffeaece1),
            fontWeight: FontWeight.bold,
            fontSize: 20),
        backgroundColor: Color(0xff8DB792),
        toolbarHeight: 70,
        leading: IconButton(
          iconSize: 15,
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xffeaece1),
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      backgroundColor: Color(0xffEAECE1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //text
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 50), //مسافه بين كلمة ساين اب و التكست فيلد

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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your first name',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your last name',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your email',
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your password',
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '   Enter your password again',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
// button
              MaterialButton(
                  elevation: 5.0,
                  color: Color(0xff8DB792),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color.fromRGBO(234, 236, 225, 0.85),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  onPressed: () async {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return homeScreen();
                      }));
                    } catch (e) {
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
