import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 211, 118, 130),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Full Name"
              ),
              validator: (text){
                if(text!.isEmpty){
                  return "Invalid Name";
                }
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Address"
              ),
              validator: (text){
                if(text!.isEmpty){
                  return "Invalid Address";
                }
              },
            ),
            SizedBox(height: 16.0,),
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
            SizedBox(height: 16.0,),
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
            SizedBox(height: 16.0,),
            SizedBox(height: 44.0, child: RaisedButton(onPressed: () {
              if (_formKey.currentState!.validate()){

              }
            },
                child: Text("Sign Up", style: TextStyle(fontSize: 18.0),),
                textColor: Colors.white,
                color: Color.fromARGB(255, 211, 118, 130)),)
          ],
        ),
      ),
    );
  }
}
