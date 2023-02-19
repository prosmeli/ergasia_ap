import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoomPost extends StatelessWidget {
  const RoomPost({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _posts =
        FirebaseFirestore.instance.collection('posts').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _posts,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 490,
            child: ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, index) {
                final postsData = snapshot.data!.docs[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250,
                      child: Image.network(
                        postsData['postImageUrl'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      color: Colors.white54,
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  postsData['caption'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
