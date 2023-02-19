import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  late String caption;

  // this functions helps us to pick image from our gallery
  postImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No image picked');
    }
  }

  Uint8List? _image;

  selectGalleryImage() async {
    Uint8List im = await postImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  _uploadImageToStorage(Uint8List? image) async {
    Reference ref =
        _storage.ref().child('profileImages').child(const Uuid().v4());

    UploadTask uploadTask = ref.putData(image!);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'Create new Room',
          ),
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: users.doc('111').get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Container(
                color: const Color(0xFFB3E5FC),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(), color: Colors.white54),
                          child: _image != null
                              ? Image.memory(
                                  _image!,
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity,
                                )
                              : IconButton(
                                  onPressed: () {
                                    selectGalleryImage();
                                  },
                                  icon: const Icon(
                                    Icons.add_a_photo,
                                    size: 168,
                                  ),
                                ),
                        ),
                        Container(
                          color: Colors.white54,
                          child: TextFormField(
                            onChanged: (value) {
                              caption = value;
                            },
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return 'Caption must not be empty!';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: 'Caption',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            EasyLoading.show(status: 'Post uploading...');
                            String postImageUrl =
                                await _uploadImageToStorage(_image);

                            await _firestore
                                .collection('posts')
                                .doc(const Uuid().v4())
                                .set({
                              'postImageUrl': postImageUrl,
                              'caption': caption,
                              'fullName': data['fullName'],
                              'photoUrl': data['image'],
                              'userId': '111',
                            }).whenComplete(() {
                              EasyLoading.dismiss();

                              setState(() {
                                _image = null;
                                _formkey.currentState!.reset();
                              });
                            });
                          },
                          child: const Text(
                            'Save the room',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
