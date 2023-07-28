import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const String screenName = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar and Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () => showAboutDialog(
                context: context,
                applicationIcon: const FlutterLogo(),
                applicationVersion: '1.0.0',
                children: const [
                  SizedBox(height: 20),
                  Text('Excepteur id nisi fugiat occaecat in ea nulla et tempor mollit amet qui. Lorem ex sint exercitation cillum deserunt labore ut est veniam. Nostrud occaecat et labore veniam in esse voluptate aliqua in et fugiat culpa non qui. Est consequat est quis excepteur adipisicing incididunt aute ad fugiat cupidatat nulla. Non mollit quis sit nulla.'),
                ],
              ),
              child: const Text('Used licenses')
            ),
            FilledButton.tonal(
              onPressed: () => OpenDialog(context: context),
              child: const Text('Show Dialog')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }

  void showCustomSnackbar(BuildContext context) {
    final snackBar = SnackBar(
        content: const Text('Hola, soy un SnackBar'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Cerrar',
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void OpenDialog({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Estás seguro?'),
          content: const Text('Ipsum excepteur consectetur aute Lorem sunt reprehenderit ad veniam. Veniam sit sunt eu in consequat sint quis fugiat est nostrud. Velit et tempor reprehenderit non et. Id et fugiat elit est id amet aliqua minim pariatur id eiusmod ut elit irure.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}