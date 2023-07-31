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
    title: 'Riverpod Counter',
    subTitle: 'Un contador simple que guarda su estado',
    link: '/counter',
    icon: Icons.add_circle_outline_rounded,
  ),

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
    subTitle: 'Contenedor animado con estado',
    link: '/animated',
    icon: Icons.animation_rounded,
  ),

  MenuItem(
    title: 'UI Controls',
    subTitle: 'Una serie de controladores de UI',
    link: '/ui_controls',
    icon: Icons.quiz_outlined,
  ),

  MenuItem(
    title: 'Tutorial',
    subTitle: 'Tutorial de bienvenida de la App',
    link: '/app_tutorial',
    icon: Icons.accessibility_rounded,
  ),

  MenuItem(
    title: 'Infinite Scroll',
    subTitle: 'Scroll infinito con carga de datos y pull para refrescar',
    link: '/infinite_scroll',
    icon: Icons.vertical_align_bottom_rounded,
  ),

  MenuItem(
    title: 'Theme Changer',
    subTitle: 'Configuración del tema de la aplicación',
    link: '/theme_changer',
    icon: Icons.color_lens_outlined,
  ),

];