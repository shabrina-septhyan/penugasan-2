import 'package:flutter/material.dart';
import 'package:tugas1/services/user.dart';
import 'package:tugas1/widgets/alert.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final UserService user = UserService();
  final formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isLoading = false;
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F9),
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFA3C7),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 24),

              Card(
                elevation: 6,
                shadowColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 24,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5D8F),
                          ),
                        ),
                        const SizedBox(height: 22),

                        TextFormField(
                          controller: email,
                          decoration: _inputDecoration(
                            "Email",
                            Icons.email_outlined,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Email harus diisi' : null,
                        ),
                        const SizedBox(height: 14),

                        TextFormField(
                          controller: password,
                          obscureText: showPass,
                          decoration: _inputDecoration(
                            "Password",
                            Icons.lock_outline,
                          ).copyWith(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPass = !showPass;
                                });
                              },
                              icon: Icon(
                                showPass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xFFFF5D8F),
                              ),
                            ),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Password harus diisi' : null,
                        ),
                        const SizedBox(height: 26),

                        // ===== TOMBOL LOGIN =====
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFFFF5D8F),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() => isLoading = true);

                                var data = {
                                  "email": email.text,
                                  "password": password.text,
                                };

                                var result = await user.loginUser(data);

                                setState(() => isLoading = false);

                                if (result.status == true) {
                                  AlertMessage().showAlert(
                                    context,
                                    result.message,
                                    true,
                                  );
                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/dashboard',
                                      );
                                    },
                                  );
                                } else {
                                  AlertMessage().showAlert(
                                    context,
                                    result.message,
                                    false,
                                  );
                                }
                              }
                            },
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 15.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // ===== TOMBOL KE REGISTER =====
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/register');
                          },
                          child: const Text(
                            "Belum punya akun? Register",
                            style: TextStyle(
                              color: Color(0xFFFF5D8F),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icon,
        size: 20,
        color: const Color(0xFFFF5D8F),
      ),
      filled: true,
      fillColor: const Color(0xFFFFF1F6),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }
}
