import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/logo.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Correo:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'johndoe@example.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Contraseña:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '********',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
