import 'package:dummy_ar_app/my_widgets/category_card.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';

class InfoCard extends StatelessWidget {
  final Category category;

  const InfoCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF42A5F5),
              blurRadius: 4.0,
              spreadRadius: .05,
            )
          ],
        ),
        height: 120,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 0),
                    height: 100,
                    width: double.infinity / 4,
                    child: Image.asset(category.image),
                  )
                ],
              ),
            ),
            Expanded(
                child: SizedBox(
              width: 3 * double.infinity / 4,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        category.description,
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
