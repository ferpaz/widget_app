import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItem> [

  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),

  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),

  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Indicadores de avance infinitos y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),

  MenuItem(
    title: 'Snackbar and Dialogs',
    subTitle: 'Alertas y diálogos en pantalla',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),

  MenuItem(
    title: 'Animated Containter',
    subTitle: 'Statefull animated container',
    link: '/animated',
    icon: Icons.animation_rounded,
  ),

];