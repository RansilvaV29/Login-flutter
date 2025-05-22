import 'package:flutter/material.dart';
import 'package:pry_login/models/loginModel.dart';

class Logincontroller {
  //validaciones

  //usuario
  String? validarUsuario(String? value) {
    if (value == null || value.isEmpty) {
      return 'El usuario es necesario';
    }

    return null;
  }

  //password

  String? validarPassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Mínimo 6 caracteres';
    }

    return null;
  }
  //iniciar sesion

  void iniciarSesion(BuildContext context, String user, String password) {
    bool isValid = false;
    String? foundUsername;

    // Buscar usuario en la lista
    for (var storedUser in LoginModel.registeredUsers) {
      if (storedUser.user == user && storedUser.password == password) {
        isValid = true;
        foundUsername = storedUser.user;
        break;
      }
    }

    if (isValid) {
      Navigator.pushNamed(context, '/wellcome', arguments: foundUsername);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Credenciales incorrectas')),
      );
    }
  }
}
