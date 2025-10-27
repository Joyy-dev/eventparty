import 'package:flutter/material.dart';

class AuthScreens extends StatefulWidget {
  const AuthScreens({super.key});

  @override
  State<AuthScreens> createState() => _AuthScreensState();
}

class _AuthScreensState extends State<AuthScreens> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _isLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  void _submitAuthForm() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      if (!_isLogin) {
        final confirmPassword = _confirmPassword.text.trim();
        if (password != confirmPassword) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password do not match'))
          );
          return;
        }
      }

      print('email = $email');
      print('password = $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final horizontalPadding = size.width > 1000 ? size.width * 0.1 : 16.0;
    return Scaffold(
      backgroundColor: Color(0xFFFF5833),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: horizontalPadding),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topLeft,
              begin: Alignment.bottomCenter,
              colors: [
                Color(0xFFFF5833),
                const Color.fromARGB(255, 226, 189, 189),
                Color(0xFFFF5833)
              ]
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _isLogin ? 'Log In' : 'Create a new account',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Card(
                          color: Color.fromARGB(255, 255, 212, 203),
                          elevation: 5,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            validator: (value) {
                              if (value == null || !value.contains('@')) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        Card(
                          elevation: 5,
                          color: Color.fromARGB(255, 255, 212, 203),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.length < 8) {
                                return 'Please enter a valid password';
                              } 
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        if (!_isLogin)
                        Card(
                          elevation: 5,
                          color: Color.fromARGB(255, 255, 212, 203),
                          child: TextFormField(
                            controller: _confirmPassword,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value != _passwordController.text) {
                                return 'Password do not match';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                          onPressed: _submitAuthForm,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xFFFF5833),
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 70),
                            elevation: 8
                          ),
                          child: Text(
                            _isLogin ? 'Sign In' : 'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),
                          )
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          }, 
                          child: Text(
                            _isLogin ? 'Are you a new user? Sign Up' : 'Already have an account? Sign In',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}