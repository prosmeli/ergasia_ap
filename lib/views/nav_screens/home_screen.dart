import 'package:dummy_ar_app/my_widgets/category_card.dart';
import 'package:dummy_ar_app/models/category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "AR Model Picker Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color(0xFFB3E5FC),
        child: Column(
          children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 30, left: 8, right: 8),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Click on a specific box and have some fun!",
                  style: TextStyle(
                      color: Color(0xFF42A5F5),
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
            )),
            GridView.builder(
              shrinkWrap: true,
              itemCount: categoryList.length,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 24,
              ),
              itemBuilder: (context, index) {
                return CategoryCard(
                  category: categoryList[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
