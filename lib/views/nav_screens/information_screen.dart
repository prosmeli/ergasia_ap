import 'package:dummy_ar_app/models/category.dart';
import 'package:dummy_ar_app/my_widgets/info_card.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFB3E5FC),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "Information Screen",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(child: _buildInfoListView()));
  }
}

Widget _buildInfoListView() {
  return ListView.builder(
      itemCount: categoryList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InfoCard(category: categoryList[index]);
      });
}
