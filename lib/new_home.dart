import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobquest/JobWall.dart';
import 'package:jobquest/ReviewsPage.dart';
import 'package:jobquest/chat/ChatPage.dart';
import 'package:jobquest/drawer.dart';
import 'package:jobquest/loginscreen.dart';
import 'package:jobquest/profile_page.dart';


class NewHome extends StatelessWidget {
 const NewHome({super.key});


 void goToProfilePage(BuildContext context) {
   Navigator.push(
     context,
     MaterialPageRoute(
       builder: (context) => const ProfilePage(),
     ),
   );
 }


 void goToChatPage(BuildContext context) {
   Navigator.push(
     context,
     MaterialPageRoute(
       builder: (context) => ChatPage(),
     ),
   );
 }


 void signOut(BuildContext context) async {
   await FirebaseAuth.instance.signOut();
   Navigator.pushReplacement(
     context,
     MaterialPageRoute(
       builder: (context) => const LoginScreen(),
     ),
   );
 }


 Future<bool> _onWillPop(BuildContext context) async {
   return await showDialog(
         context: context,
         builder: (context) => AlertDialog(
           title: Text('Exit App'),
           content: Text('Do you want to exit the app?'),
           actions: <Widget>[
             TextButton(
               onPressed: () => Navigator.of(context).pop(false),
               child: Text('No'),
             ),
             TextButton(
               onPressed: () => Navigator.of(context).pop(true),
               child: Text('Yes'),
             ),
           ],
         ),
       ) ??
       false;
 }


 @override
 Widget build(BuildContext context) {
   // ignore: deprecated_member_use
   return WillPopScope(
     onWillPop: () => _onWillPop(context),
     child: Scaffold(
       appBar: AppBar(
         title: Text("ASSIGNMENT QUEST",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
         backgroundColor: Colors.deepPurpleAccent,
       ),
       drawer: MyDrawer(
         onProfileTap: () => goToProfilePage(context),
         onChatTap: () => goToChatPage(context),
         onSignoutTap: () => signOut(context),
       ),
       body: Container(


         decoration: BoxDecoration(
           image: DecorationImage(
             image: NetworkImage('https://www.example.com/your-image.jpg'), // Replace with an actual URL
             fit: BoxFit.cover,
           ),
         ),
         child: Center(


           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const ReviewsPage()),
                   );
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.purple,
                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                 ),
                 child: Column(
                   children: [
                     Icon(Icons.star_border, size: 30, color: Colors.white),
                     SizedBox(height: 10),
                     Text('Review', style: TextStyle(color: Colors.white, fontSize: 20)),
                   ],
                 ),
               ),
               const SizedBox(height: 30),
               ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const JobWall()),
                   );
                 },
                 style: ElevatedButton.styleFrom(
                  // Button color
                  backgroundColor: Colors.purple,
                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                 ),
                 child: Column(
                   children: [
                     Icon(Icons.work, size: 30, color: Colors.white),
                     SizedBox(height: 10),
                     Text('Assignments', style: TextStyle(color: Colors.white, fontSize: 20)),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
 }
}



