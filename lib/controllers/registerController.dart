import 'package:flutter/material.dart';
import 'package:pry_login/models/loginModel.dart';

class RegisterController {
  // Validar nombre de usuario
  String? validarUsuario(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El usuario es obligatorio';
    }
    if (value.length < 3) {
      return 'Debe tener al menos 3 caracteres';
    }
    return null;
  }

  // Validar correo electrónico
  String? validarEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El correo es obligatorio';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Correo no válido';
    }
    return null;
  }

  // Validar contraseña
  String? validarPassword(String? value) {
    if (value == null || value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  // Registrar usuario (simulado)
  void registrarUsuario(BuildContext context, String user, String email, String password) {
    // Verificar si el usuario o email ya existen
    for (var existingUser in LoginModel.registeredUsers) {
      if (existingUser.user == user) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('El nombre de usuario ya está en uso'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      if (existingUser.email == email) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('El correo electrónico ya está registrado'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    // Agregar nuevo usuario a la lista
    LoginModel.registeredUsers.add(LoginModel(user: user, email: email, password: password));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Usuario "$user" registrado correctamente'),
        backgroundColor: Colors.green,
      ),
    );

    // Navegar a login
    Navigator.pushReplacementNamed(context, '/');
  }
}
