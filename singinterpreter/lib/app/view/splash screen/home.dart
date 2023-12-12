import 'package:flutter/material.dart';
import 'package:singinterpreter/app/view/splash%20screen/aboutus.dart';
import 'package:singinterpreter/app/view/splash%20screen/diccionary.dart';
import 'package:singinterpreter/app/view/splash%20screen/interpretador.dart';
import 'package:singinterpreter/app/view/splash%20screen/login.dart';
import 'package:singinterpreter/app/view/splash%20screen/plans.dart';
import 'package:singinterpreter/app/view/splash%20screen/profile.dart';
import 'package:singinterpreter/app/view/splash%20screen/suport.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final logoHeight = screenHeight * 0.20; // 20% de la pantalla para el logo

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(logoHeight),
        child: AppBar(
          title: Image.asset('assets/logo.png',
              height:
                  logoHeight), // Asegúrate de que la ruta de la imagen sea correcta
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: (screenWidth /
            (screenHeight /
                2.5)), // Ajusta esto para cambiar cómo se ven las tarjetas
        padding: EdgeInsets.all(10),
        children: <Widget>[
          FunctionCard(
            title: 'Interpretador',
            imageAsset: 'assets/interpretador.png',
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            imageWidth: 112,
            imageHeight: 78,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InterpretePage()),
              );
            },
          ),
          FunctionCard(
            title: 'Mi Perfil',
            imageAsset: 'assets/miperfil.png',
            imageWidth: 94,
            imageHeight: 78,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          FunctionCard(
            title: 'Planes',
            imageAsset: 'assets/planes.jpg',
            imageWidth: 78,
            imageHeight: 85,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => planspage()),
              );
            },
          ),
          FunctionCard(
            title: 'Diccionario',
            imageAsset: 'assets/diccionario.jpg',
            imageWidth: 86,
            imageHeight: 65,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DictionaryScreen()),
              );
            },
          ),
          FunctionCard(
            title: 'Sobre Nosotros',
            imageAsset: 'assets/sobrenosotros.png',
            imageWidth: 99,
            imageHeight: 85,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
              );
            },
          ),
          FunctionCard(
            title: 'Soporte y Preguntas Frecuentes',
            imageAsset: 'assets/soporte.jpg',
            imageWidth: 82,
            imageHeight: 97,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SupportPage()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent, // Hace el fondo transparente
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TextButton(
            onPressed: () {
              // Implementar la lógica de cerrar sesión aquí
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text(
              'Cerrar Sesión',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FunctionCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final TextStyle textStyle;
  final double? imageWidth;
  final double? imageHeight;
  final VoidCallback? onTap;

  const FunctionCard({
    Key? key,
    required this.title,
    required this.imageAsset,
    this.textStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    this.imageWidth,
    this.imageHeight,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imageAsset,
              height: imageHeight,
              width: imageWidth,
            ), // Imagen para la tarjeta
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                style: textStyle,
                textAlign: TextAlign.center,
              ), // Texto para la tarjeta
            ),
          ],
        ),
      ),
    );
  }
}
