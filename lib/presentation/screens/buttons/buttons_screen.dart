import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String screenName = 'buttons_screen';

  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Buttons Screen'),
        ),
        body: const _ButtonsView(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back_ios_new_rounded, color: colors.primary),
          onPressed: () {
            context.pop();
          },
        ));
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarms_rounded),
              label: const Text('Elevated Icon'),
            ),

            FilledButton(
              onPressed: () {},
              child: const Text('FilledButton'),
            ),

            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.accessibility_new_rounded),
              label: const Text('FilledButton'),
            ),

            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.terminal),
              label: const Text('Outlined'),
            ),

            TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_tree_rounded),
              label: const Text('Text'),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
            ),
            IconButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(colors.tertiary),
                iconColor: MaterialStateProperty.all(colors.onPrimary),
              ),
              icon: const Icon(Icons.app_registration_rounded),
            ),

            const CustomButton(),

            // DropdownButton(
            //   onPressed: () {},
            //   title: 'Dropdown',
            // ),

            // ToggleButtons(
            //   title: 'Toggle',
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('Hola Mundo', style: TextStyle(color: colors.onPrimary, fontWeight: FontWeight.bold),),
            ),
        ),
      ),
    );
  }
}
