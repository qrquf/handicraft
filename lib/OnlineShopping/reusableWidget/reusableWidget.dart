import 'package:flutter/material.dart';

//reusable textFields
TextField reusableTextField(String text, IconData icon, bool isPassType,
    TextEditingController controller,{vvv}) {
  return TextField(
    onChanged: (value)=>value=vvv,
    controller: controller,
    obscureText: isPassType,
    enableSuggestions: !isPassType,
   // minLines: 1,
    //maxLines: 6,
    autocorrect: !isPassType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(0.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1).withOpacity(0.9),
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType:
        isPassType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

//Reusable Buttons
Container buttons(BuildContext context, String text, Function onPressed) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(10),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Text(
        //isLogIn ? !isSignUp ? "Login" : "SignUp" : "OK",
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}
