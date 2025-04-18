//Done
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobquest/wall_post.dart';
import 'package:jobquest/my_text_field.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //controller
  final textController = TextEditingController();

  // post msg
  void postMessage() {
    //only post if there is something in the text field
    if (textController.text.isNotEmpty) {
      //store in firebase
      FirebaseFirestore.instance.collection('User Posts').add({
        'UserEmail': currentUser.email,
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
      });
    }

//clear the text field
    setState(() {
      textController.clear();
    });
  }

  late String userEmail;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email!;
      });
    } else {
      // Handle the case where no user is logged in
      userEmail = 'No user logged in';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Wall',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true, // Center the title
      ),
      body: Center(
        child: Column(
          children: [
            //the wall
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("User Posts")
                    .orderBy(
                      "TimeStamp",
                      descending: false,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        //get the message
                        final post = snapshot.data!.docs[index];
                        return WallPost(
                          message: post['Message'],
                          User: post['UserEmail'],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error:${snapshot.error}'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),

 //post msg
            Padding(
              padding: const EdgeInsets.all(25.0),

                child: Row(
                  children: [
                    Expanded(

                      child: MyTextField(

                        controller: textController,
                        hintText: "Post a Review",

                        obsecureText: false,

                      ),

                    ),

                    //post button
                    IconButton(
                      onPressed: postMessage,
                      icon: const Icon(Icons.arrow_circle_up,),
                    ),

                  ],
                ),

            ),
            //logged in as
            Text('Logged in as: $userEmail'),
          ],
        ),
      ),
    );
  }
}

