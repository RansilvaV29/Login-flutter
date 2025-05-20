import 'package:flutter/material.dart';

class Wellcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el nombre del usuario desde los argumentos
    final String username = ModalRoute.of(context)?.settings.arguments as String? ?? 'Usuario';

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emoji_emotions, color: Colors.white, size: 100),
              SizedBox(height: 20),
              Text(
                '¡Bienvenido, $username!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                'Nos alegra verte de nuevo.',
                style: TextStyle(color: Colors.white70, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
