import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }


  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Voluptate mollit non excepteur fugiat do ex ullamco excepteur enim magna ad sint deserunt ad. Magna sit do culpa id. Lorem minim adipisicing dolor ea est pariatur non in ea pariatur ex tempor do. Et tempor fugiat fugiat commodo sit adipisicing proident adipisicing nostrud. Ea commodo ex dolore sint do. Nostrud cupidatat mollit aliqua esse nulla ullamco elit duis excepteur ex. Sit Lorem cillum nulla exercitation officia laborum.'),
        actions: [
          TextButton(onPressed: ()=> context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar')),
        ],
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar & Dialogues'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context,
                children: [
                  const Text('Do sit proident cillum adipisicing laborum irure aliqua ut in voluptate nisi. Amet ullamco proident occaecat aliquip velit nulla consequat ullamco commodo. Voluptate laboris do velit do sint ex labore nulla excepteur nisi proident veniam.')
                ]
                );
              }, 
              child: const Text('Licencias usadas')),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar diálogo')),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}