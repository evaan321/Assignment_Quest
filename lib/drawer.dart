import 'package:flutter/material.dart';
import 'package:jobquest/my_list_title.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onChatTap;
  final void Function()? onSignoutTap;

  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onChatTap,
    required this.onSignoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurpleAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //header
              DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 64,
                ),
              ),

              //home list tile
              MyListTitle(
                icon: Icons.home,
                text: 'H O M E',
                onTap: () => Navigator.pop(context),
              ),
              
              MyListTitle(
                icon: Icons.chat,
                text: 'C H A T',
                onTap: onChatTap,
              ),
              //Profile list tile
              MyListTitle(
                icon: Icons.person,
                text: 'P R O F I L E',
                onTap: onProfileTap,
              ),
            ],
          ),

          //Logout list tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTitle(
              icon: Icons.logout,
              text: 'L O G O U T',
              onTap: onSignoutTap,
            ),
          ),
        ],
      ),
    );
  }
  
}