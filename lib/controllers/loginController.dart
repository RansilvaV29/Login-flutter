import 'package:flutter/material.dart';

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
    //validar credenciales
    if (user == 'raul' && password == '123456') {
      Navigator.pushNamed(context, '/wellcome', arguments: user);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Credenciales incorrectas')));
    }
  }
}
