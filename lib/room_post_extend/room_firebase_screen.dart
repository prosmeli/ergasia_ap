import 'package:dummy_ar_app/room_post_extend/post_screen.dart';
import 'package:dummy_ar_app/room_post_extend/room_post.dart';
import 'package:flutter/material.dart';
import 'post_screen.dart';
import 'room_post.dart';

class RoomFirebaseScreen extends StatelessWidget {
  const RoomFirebaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Firebase Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color(0xFFB3E5FC),
        child: Column(
          children: const [
            //Stories(),
            RoomPost(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF42A5F5),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PostScreen();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
