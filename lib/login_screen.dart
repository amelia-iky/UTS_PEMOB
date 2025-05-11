import 'package:flutter/material.dart';
import 'package:flutter_utspemob_ameng/data/nasabah_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'pages/register_mbanking_page.dart';
import 'pages/forgot_password_page.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String usernameError = '';
  String passwordError = '';

  void _login() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    const validUsername = "Ameng";
    const validPassword = "221204";

    setState(() {
      usernameError = '';
      passwordError = '';
    });

    if (username != validUsername) {
      setState(() {
        usernameError = "Username salah";
      });
    } else if (password != validPassword) {
      setState(() {
        passwordError = "Password salah";
      });
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(nasabah: nasabahDummy),
        ),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.blue[900],
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                "Koperasi Undiksha",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Image.asset('assets/logo.png', height: 100),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                    errorText: usernameError.isEmpty ? null : usernameError,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    errorText: passwordError.isEmpty ? null : passwordError,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterMbankingPage(),
                          ),
                        );
                      },
                      child: Text("Daftar Mbanking"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                           builder: (context) => ResetPasswordPage(),
                          ),
                        );
                      },
                      child: Text("Lupa password?"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[300],
            child: Text("Created by amelia"),
          ),
        ],
      ),
    );
  }
}
