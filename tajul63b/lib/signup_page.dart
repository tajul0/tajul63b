import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _key = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  bool _obs = true;
  bool _obs2 = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  InputDecoration dec(String hint, Widget? icon) => InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: const Color(0xFFFAFAFA),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    suffixIcon: icon,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: const Color(0xFF4ADE80),
        elevation: 0,
        title: const Text(
          "SebaWala",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(30),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 20),
            ],
          ),

          child: Form(
            key: _key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'SebaWala',
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.w900),
                ),
                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                /// EMAIL
                TextFormField(
                  controller: _email,
                  decoration: dec("Email", null),
                  validator: (v) => v == null || v.isEmpty ? "Required" : null,
                ),

                const SizedBox(height: 15),

                /// PASSWORD
                TextFormField(
                  controller: _password,
                  obscureText: _obs,
                  decoration: dec(
                    "Password",
                    IconButton(
                      icon: Icon(
                        _obs ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obs = !_obs;
                        });
                      },
                    ),
                  ),
                  validator: (v) =>
                      v == null || v.length < 6 ? "Min 6 chars" : null,
                ),

                const SizedBox(height: 15),

                /// CONFIRM PASSWORD
                TextFormField(
                  controller: _confirm,
                  obscureText: _obs2,
                  decoration: dec(
                    "Confirm Password",
                    IconButton(
                      icon: Icon(
                        _obs2 ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obs2 = !_obs2;
                        });
                      },
                    ),
                  ),
                  validator: (v) => v != _password.text ? "Not match" : null,
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/login');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: const Color.fromARGB(255, 229, 226, 226),
                      elevation: 5,
                      shadowColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// LOGIN TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
