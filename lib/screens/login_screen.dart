import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineshopflutter/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log-in"),
        backgroundColor: Color.fromARGB(255, 211, 118, 130),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: Text(
              "Create Account",
              style: TextStyle(fontSize: 15.0),
            ),
            textColor: Colors.white,
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Email"
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if(text!.isEmpty || !text.contains("@")){
                  return "Invalid Email";
                }
              },
            ),
            SizedBox(),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Password"
              ),
              validator: (text){
                if(text!.isEmpty || text.length < 6){
                  return "Invalid Password";
                }
              },
              obscureText: true,

            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text("Forgot my Password", textAlign: TextAlign.right,),
                padding: EdgeInsets.all(0),
              ),
            ),
            SizedBox(height: 16.0,),
            SizedBox(height: 44.0, child: RaisedButton(onPressed: () {
              if (_formKey.currentState!.validate()){

              }
            },
                child: Text("Sign-in", style: TextStyle(fontSize: 18.0),),
                textColor: Colors.white,
                color: Color.fromARGB(255, 211, 118, 130)),)
          ],
        ),
      ),
    );
  }
}
