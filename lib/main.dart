import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectuts/page/Dashboard.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _UsernameValidate = TextEditingController();
  TextEditingController _passwordValidate = TextEditingController();

  Void_login() {
    String Username = _UsernameValidate.text;
    String Password = _passwordValidate.text;
    if (Username == "Irpan" && Password == "123") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } else {
      Fluttertoast.showToast(
          msg: "Username atau Password salah!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 50.0),
                height: 320,
                child: Column(
                  children: [
                    Image.asset(
                      'asset/Logo.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "Muslim Day",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 430,
                child: Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 60, bottom: 15),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _UsernameValidate,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.person),
                          hintText: "Username",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.grey),
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 80),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _passwordValidate,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: Icon(Icons.lock),
                            hintText: "password",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 80)),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 200,
                      height: 51,
                      child: ElevatedButton(
                          onPressed: Void_login,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF4CDB4C),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
