import 'package:flutter/material.dart';
import '../controllers/registerController.dart';
import '../themes/text_styles.dart';
import '../themes/button_styles.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro'), backgroundColor: Colors.purple),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Icon(Icons.app_registration, size: 100, color: Colors.white),
                  SizedBox(height: 20),

                  // Usuario
                  TextFormField(
                    controller: userController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: 'Nombre de usuario',
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: controller.validarUsuario,
                  ),
                  SizedBox(height: 16),

                  // Email
                  TextFormField(
                    controller: emailController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      hintText: 'Correo electrónico',
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: controller.validarEmail,
                  ),
                  SizedBox(height: 16),

                  // Contraseña
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      hintText: 'Contraseña',
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: controller.validarPassword,
                  ),
                  SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: registrar,
                    style: AppButtonStyles.primary,
                    child: Text('Registrarse', style: AppTextStyles.button),
                  ),
                  SizedBox(height: 12),

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Text('¿Ya tienes cuenta? Inicia sesión'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registrar() {
    if (formKey.currentState!.validate()) {
      final user = userController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      controller.registrarUsuario(context, user, email, password);
    }
  }
}
