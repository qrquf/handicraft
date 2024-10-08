import 'package:ecommerce/Api/subghttp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/Api/sellerhttp.dart';
import 'package:ecommerce/Api/userhttp.dart';
import 'package:ecommerce/OnlineShopping/ForgotPassword.dart';
import 'package:ecommerce/OnlineShopping/OnlineShopping.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:intl/intl.dart';
import 'SignUpPage.dart';

int i = 0;
var j = 0;

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passController = TextEditingController();

class LoginPage extends StatefulWidget {
  var x;
  LoginPage({this.x}) {
    print("hi");
  }

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  String s = "Enter password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent, Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.1,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                // App logo or icon
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 80,
                ),
                SizedBox(height: 40),

                // Email input field
                reusableTextField(
                  "Enter User Mail",
                  Icons.person_outline,
                  false,
                  _emailController,
                ),
                const SizedBox(height: 20),

                // Password input field with validation
                TextFormField(
                  controller: _passController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                    helperText: s,
                    helperStyle: TextStyle(color: Colors.white),
                  ),
                  onSaved: (value) {
                    if (!regex.hasMatch(value.toString())) {
                      s = "Enter a valid password";
                    }
                  },
                ),
                const SizedBox(height: 20),

                // Stylish login button with gradient
                buttons(
                  context,
                  "Log In",
                  () async {
                    postApiHttp1 http = postApiHttp1();
                    await http.saveData(_emailController.text.toString(),
                        _passController.text.toString());
                    j = await http.givedata(0);
                    if (j == 0) {
                      DateTime date = DateTime.now();
                      String format = DateFormat('yyyy-MM-dd').format(date);
                      DateTime ss = DateTime(date.year, date.month - 1, date.day - 1);
                      String format1 = DateFormat('yyyy-MM-dd').format(ss);

                      httpServices21 htp = httpServices21();
                      htp.del1(format1);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnlineShopping(
                            _emailController.text.toString(),
                            _passController.text.toString(),
                          ),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Invalid email or password entered"),
                          content: ElevatedButton(
                            child: Text("O.K"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),

                // Forgot password link
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // OR text
                const Text(
                  "OR",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Sign up redirect link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        " Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Xyz(context) {
  if (i == 1) {
    return buttons(
      context,
      "Log In",
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                OnlineShopping(_emailController.text, _passController.text),
          ),
        );
      },
    );
  } else {
    return buttons(context, "Log In", () {});
  }
}
