import 'package:flutter/material.dart';
import 'package:korea/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget myNewsCardData(int index) {
    return Card(
      child: Column(
        children: [
          Image.network(
            DataSources.myNews[index]['image'],
            height: 80,
          ),
          Center(
            child: Text(
              DataSources.myNews[index]['headline'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
        backgroundColor: Colors.blue,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? GridView.builder(
                  itemCount: DataSources.myNews.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => myNewsCardData(index),
                )
              : ListView.builder(
                  itemCount: DataSources.myNews.length,
                  itemBuilder: (context, index) => myNewsCardData(index),
                );
        },
      ),
    );
  }
}
