import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon});
}


const appMenuItems = <MenuItem>[

  MenuItem(
    title: 'botones', 
    subTitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'tarjetas', 
    subTitle: 'Varios botones en Flutter', 
    link: '/cards', 
    icon: Icons.credit_card
  ),

];