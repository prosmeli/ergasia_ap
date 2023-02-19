import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => category.widget),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF42A5F5),
                blurRadius: 4.0,
                spreadRadius: .05,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                category.image,
                width: 75,
                height: 75,
              ),
              Text(
                category.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
