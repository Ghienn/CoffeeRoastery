import 'package:coffee_roastery/screens/about_us.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    // final name = 'Sarah Abs';
    // final email = 'sarah@abs.com';
    // final urlImage =
    //     'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Image(image: AssetImage('assets/sidebar.png')),
            // Divider(
            //   color: AppTheme.darkColor,
            // ),
            // buildHeader(
            //     urlImage: urlImage, name: name, email: email, onClicked: () {}
            //     // onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            //     //   builder: (context) => UserPage(
            //     //     name: 'Sarah Abs',
            //     //     urlImage: urlImage,
            //     //   ),
            //     // )),
            //     ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  // const SizedBox(height: 12),
                  // buildSearchField(),
                  // const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'About us',
                    icon: Icons.info_rounded,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'Favourites',
                  //   icon: Icons.favorite_border,
                  //   onClicked: () => selectedItem(context, 1),
                  // ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'Workflow',
                  //   icon: Icons.workspaces_outline,
                  //   onClicked: () => selectedItem(context, 2),
                  // ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'Updates',
                  //   icon: Icons.update,
                  //   onClicked: () => selectedItem(context, 3),
                  // ),
                  // const SizedBox(height: 24),
                  // Divider(color: Colors.white70),
                  // const SizedBox(height: 24),
                  // buildMenuItem(
                  //   text: 'Plugins',
                  //   icon: Icons.account_tree_outlined,
                  //   onClicked: () => selectedItem(context, 4),
                  // ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'Notifications',
                  //   icon: Icons.notifications_outlined,
                  //   onClicked: () => selectedItem(context, 5),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildHeader({
  //   required String urlImage,
  //   required String name,
  //   required String email,
  //   required VoidCallback onClicked,
  // }) =>
  //     InkWell(
  //       onTap: onClicked,
  //       child: Container(
  //         padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
  //         child: Row(
  //           children: [
  //             CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
  //             SizedBox(width: 20),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   name,
  //                   style: TextStyle(fontSize: 20, color: Colors.white),
  //                 ),
  //                 const SizedBox(height: 4),
  //                 Text(
  //                   email,
  //                   style: TextStyle(fontSize: 14, color: Colors.white),
  //                 ),
  //               ],
  //             ),
  //             Spacer(),
  //             CircleAvatar(
  //               radius: 24,
  //               backgroundColor: Color.fromRGBO(30, 60, 168, 1),
  //               child: Icon(Icons.add_comment_outlined, color: Colors.white),
  //             )
  //           ],
  //         ),
  //       ),
  //     );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = AppTheme.textColor;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: TextStyle(
              color: color, fontFamily: 'SF Pro Display', fontSize: 20)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Get.to(AboutUsPage());
        break;
      case 1:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => FavouritesPage(),
        // ));
        break;
    }
  }
}
