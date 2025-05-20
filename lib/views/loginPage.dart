import 'dart:math';

import 'package:flutter/material.dart';
import '../controllers/loginController.dart';
import '../themes/button_styles.dart';
import '../themes/color_schemes.dart';
import '../themes/text_styles.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  //logica
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //instanciar la clase controller
  final controller = Logincontroller();

  //manejo de estaos
  bool remember = false;
  bool isLoading = false;
  String? errorMessage;

  //diseñof
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('login Usuario', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.person, size: 100, color: Colors.purple),
                  SizedBox(height: 20),

                  //usuario
                  TextFormField(
                    controller: userController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white54),
                      hintText: 'uauario',
                      hintStyle: TextStyle(color: Colors.white10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: controller.validarUsuario,
                  ),
                  SizedBox(height: 16),

                  // Contraseña
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white70),
                      hintText: 'Contraseña',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: controller.validarPassword,
                  ),
                  SizedBox(height: 12),

                  //recordar
                  Row(
                    children: [
                      Checkbox(
                        value: remember,
                        onChanged: (value) {
                          setState(() {
                            remember = value ?? false;
                          });
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.purple,
                      ),
                      Text('Recordarme', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 12),

                  // Mensaje de error
                  if (errorMessage != null)
                    Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.redAccent),
                      textAlign: TextAlign.center,
                    ),

                  // Botón login
                  ElevatedButton(
                    onPressed: login,
                    style: AppButtonStyles.primary,
                    child: Text('Iniciar Sesión', style: AppTextStyles.button),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      final username = userController.text.trim();
      final password = passwordController.text.trim();
      controller.iniciarSesion(context, username, password);
    }
  }
}
