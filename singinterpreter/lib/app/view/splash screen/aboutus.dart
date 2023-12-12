import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: ListView(
        children: [
          _buildCard(
            image: AssetImage('assets/image1.png'),
            role: 'Role 1',
            description: 'Description 1',
          ),
          _buildCard(
            image: AssetImage('assets/image2.png'),
            role: 'Role 2',
            description: 'Description 2',
          ),
          _buildCard(
            image: AssetImage('assets/image3.png'),
            role: 'Role 3',
            description: 'Description 3',
          ),
          _buildCard(
            image: AssetImage('assets/image4.png'),
            role: 'Role 4',
            description: 'Description 4',
          ),
          _buildCard(
            image: AssetImage('assets/image5.png'),
            role: 'Role 5',
            description: 'Description 5',
          ),
          _buildCard(
            image: AssetImage('assets/image6.png'),
            role: 'Role 6',
            description: 'Description 6',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      {required ImageProvider image,
      required String role,
      required String description}) {
    return Card(
      child: Column(
        children: [
          Image(image: image),
          Text(role),
          Text(description),
        ],
      ),
    );
  }
}
