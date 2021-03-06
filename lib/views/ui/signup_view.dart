import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/views/ui/homepage_view.dart';
import 'package:chat_app/views/ui/login_view.dart';
import 'package:chat_app/views/utils/validator_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final AuthenticationService auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 30),
                child: Text(
                  'ChatApp',
                  style: GoogleFonts.abel(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.deepPurple,
                          ],
                        ).createShader(
                          const Rect.fromLTWH(0.0, 0.0, 250.0, 100.0),
                        )),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text(
                      'Signup',
                      style: GoogleFonts.notoSerif(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) => Validator.validateUsername(value!),
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Username',
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => Validator.validateEmail(value!),
                      controller: emailController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Email',
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) => Validator.validatePassword(value!),
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Password',
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value == passwordController.text) {
                          return null;
                        } else {
                          return 'Password does not match';
                        }
                      },
                      obscureText: true,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // print('New user ${usernameController.text}');
                          await auth.signUp(
                              username: usernameController.text,
                              email: emailController.text,
                              password: passwordController.text.trim(),
                              confirmPassword: confirmPasswordController.text);
                        }
                        //FocusScope.of(context).unfocus();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 1,
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Center(
                          child: Text(
                            "SignUp",
                            style: GoogleFonts.notoSerif(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.notoSerif(),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginView()));
                          },
                          child: Text(
                            'SignIn',
                            style: GoogleFonts.notoSerif(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
