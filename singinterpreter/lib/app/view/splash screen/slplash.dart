import 'package:flutter/material.dart';
import 'package:singinterpreter/app/view/splash%20screen/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Map<String, String>> welcomeData = [
    {
      "image": "assets/bien1.png",
      "text": "Bienvenido a SingInterpreter y disfruta de tu estadia",
    },
    {
      "image": "assets/bien2.png",
      "text": "Explora las funciones y la intefaz de nuestro aplicativo",
    },
    {
      "image": "assets/bien3.png",
      "text": "Conéctate y disfruta de nuestro interpretador de señas",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              // Navegar a la pantalla de login al presionar "Saltar"
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text(
              "Saltar",
              style: TextStyle(color: Color.fromRGBO(1, 89, 88, 1)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: welcomeData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) => WelcomePage(
                  image: welcomeData[index]["image"] ?? "",
                  text: welcomeData[index]["text"] ?? "",
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Ir a la página anterior
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Text("Anterior"),
                ),
                Row(
                  children: List.generate(
                    welcomeData.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Ir a la página siguiente o al login si es la última página
                    if (_currentPage == welcomeData.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(_currentPage == welcomeData.length - 1
                      ? "Login"
                      : "Siguiente"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final String image;
  final String text;

  WelcomePage({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 200,
        ),
        SizedBox(height: 20),
        Text(
          text,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
