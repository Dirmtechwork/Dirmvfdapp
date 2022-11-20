import 'dart:convert';

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_complete_guide/screens/bottom_nav_page.dart';
import 'package:http/http.dart' as http;
import '../bottom_nav_page.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();
  //editing Controller
  final businessNameEditingController = TextEditingController();
  final tinNumberEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //business name field
    final businessNameField = TextFormField(
      autofocus: false,
      controller: businessNameEditingController,
      keyboardType: TextInputType.name,
      // validator: {} {},
      onSaved: (value) {
        businessNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Business Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //Tin number field
    final tinNumberField = TextFormField(
      autofocus: false,
      controller: tinNumberEditingController,
      keyboardType: TextInputType.name,
      // validator: {} {},
      onSaved: (value) {
        tinNumberEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Tin Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      // validator: {} {},
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //phone number field
    final phoneNumberField = TextFormField(
      autofocus: false,
      controller: phoneNumberEditingController,
      keyboardType: TextInputType.name,
      // validator: {} {},
      onSaved: (value) {
        phoneNumberEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.contact_phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      // validator: {} {},
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //confirm password
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,

      // validator: {} {},
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

//signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          setState(() {
            loading = true;
          });
          _register().then(
              (_) =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BottomNavPage();
                  })), onError: (e) {
            //var snackBar = SnackBar(content: Text('Failed: $e'));
            //ScaffoldMessenger.of(context).showSnackBar(snackBar);
            print("error: $e");
          });
        },
        child: const Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blueGrey),
          onPressed: () {
            //passin this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 180,
                    child: Image.asset(
                      "assets/dirm_logo.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 45),
                  businessNameField,
                  SizedBox(height: 15),
                  tinNumberField,
                  SizedBox(height: 15),
                  emailField,
                  SizedBox(height: 15),
                  phoneNumberField,
                  SizedBox(height: 15),
                  passwordField,
                  SizedBox(height: 15),
                  confirmPasswordField,
                  SizedBox(height: 15),
                  signUpButton,
                  SizedBox(height: 10),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  // btn
  Future _register() async {
    var result =
        await http.post(Uri.parse('http://192.168.43.95:8000/api/clients'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'business_name': businessNameEditingController.text,
              'tin': tinNumberEditingController.text,
              'mobile': phoneNumberEditingController.text,
              'email': emailEditingController.text,
              'password': passwordEditingController.text,
              'password_confirmation': confirmPasswordEditingController.text,
            }));

    if (result.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return jsonDecode(result.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to register user: ${result.statusCode}.');
    }
  }
}
