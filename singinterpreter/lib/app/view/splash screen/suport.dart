import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soporte y Preguntas Frecuentes'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('¿Qué es un intérprete de señas?'),
            subtitle: Text(
                'Un intérprete de señas es una persona que traduce el lenguaje de señas a un idioma hablado y viceversa.'),
          ),
          ListTile(
            title: Text('¿Cómo puedo contactar al soporte técnico?'),
            subtitle: Text(
                'Puedes contactar a nuestro equipo de soporte técnico enviando un correo electrónico a support@example.com.'),
          ),
          ListTile(
            title: Text('¿Cuáles son los requisitos mínimos del sistema?'),
            subtitle: Text(
                'Los requisitos mínimos del sistema son un dispositivo con sistema operativo Android 7.0 o superior, o iOS 11.0 o superior.'),
          ),
          // Agrega más preguntas y respuestas aquí...
          ListTile(
            title: Text('¿Tienes alguna otra pregunta?'),
            subtitle: Text(
                'Si tienes alguna otra pregunta, no dudes en contactarnos.'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para abrir la pantalla de contacto
        },
        child: Icon(Icons.mail),
        tooltip: 'Contactanos',
      ),
    );
  }
}
