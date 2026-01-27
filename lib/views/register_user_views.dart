import 'package:flutter/material.dart';
import 'package:tugas1/services/user.dart';
import 'package:tugas1/widgets/alert.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({super.key});

  @override
  State<RegisterUserView> createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  final UserService userService = UserService();
  final formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  List<String> roleChoice = ["admin", "user"];
  String? role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F9),
      appBar: AppBar(
        title: const Text("Register User"),
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
                          "Create Account",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF5D8F),
                          ),
                        ),
                        const SizedBox(height: 22),

                        TextFormField(
                          controller: name,
                          decoration: _inputDecoration(
                            "Name",
                            Icons.person_outline,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Nama harus diisi' : null,
                        ),
                        const SizedBox(height: 14),

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

                        DropdownButtonFormField<String>(
                          value: role,
                          decoration: _inputDecoration(
                            "Role",
                            Icons.badge_outlined,
                          ),
                          items: roleChoice
                              .map(
                                (r) =>
                                    DropdownMenuItem(value: r, child: Text(r)),
                              )
                              .toList(),
                          onChanged: (value) => setState(() => role = value),
                          validator: (value) =>
                              value == null ? 'Role harus dipilih' : null,
                        ),
                        const SizedBox(height: 14),

                        TextFormField(
                          controller: password,
                          obscureText: true,
                          decoration: _inputDecoration(
                            "Password",
                            Icons.lock_outline,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Password harus diisi' : null,
                        ),
                        const SizedBox(height: 26),

                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF5D8F),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),

                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                var data = {
                                  "name": name.text,
                                  "email": email.text,
                                  "role": role,
                                  "password": password.text,
                                };

                                var result = await userService.registerUser(
                                  data,
                                );

                                if (result.status == true) {
                                  name.clear();
                                  email.clear();
                                  password.clear();
                                  setState(() => role = null);

                                  AlertMessage().showAlert(
                                    context,
                                    result.message,
                                    true,
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
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 15.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Text(
                            "Sudah punya akun? Login",
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
      prefixIcon: Icon(icon, size: 20, color: Color(0xFFFF5D8F)),
      filled: true,
      fillColor: const Color(0xFFFFF1F6),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }
}
