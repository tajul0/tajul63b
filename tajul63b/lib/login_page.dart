import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _pass = TextEditingController();

  bool _obs = true;

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  InputDecoration dec(String hint, Widget? icon) => InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: const Color(0xFFFAFAFA),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    suffixIcon: icon,
  );

  Widget label(String text) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );

  Widget space([double h = 12]) => SizedBox(height: h);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: const Color(0xFF4ADE80),
        elevation: 0,
        title: const Text(
          'SebaWala',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(40),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 20,
                ),
              ],
            ),

            child: Form(
              key: _key,
              child: Column(
                children: [
                  const Text(
                    'SebaWala',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w900),
                  ),

                  space(28),

                  const Text(
                    'Login Account',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),

                  space(40),

                  /// EMAIL
                  label('Email'),
                  space(),

                  TextFormField(
                    controller: _email,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Required' : null,
                    decoration: dec('Enter email', null),
                  ),

                  space(24),

                  /// PASSWORD
                  label('Password'),
                  space(),

                  TextFormField(
                    controller: _pass,
                    obscureText: _obs,
                    validator: (v) =>
                        v == null || v.length < 6 ? 'Min 6 chars' : null,
                    decoration: dec(
                      'Enter password',
                      IconButton(
                        icon: Icon(
                          _obs
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _obs = !_obs;
                          });
                        },
                      ),
                    ),
                  ),

                  space(32),

                  /// LOGIN BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4285F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                  ),

                  space(24),

                  /// SIGNUP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF4285F4),
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
