import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String screenName = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const Center(
        child: _UIControlsView(),
      ),
    );
  }
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloperMode = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  Transportation selectedTransportation = Transportation.car;

  String mealsSelected()
  {
    if (!(wantsBreakfast || wantsLunch || wantsDinner)) {
      return 'No meals selected';
    }

    var meals = (wantsBreakfast ? ' Breakfast /' : '') + (wantsLunch ? ' Lunch /' : '') + (wantsDinner ? ' Dinner /' : '');
    meals = meals.substring(0, meals.length - 1).trim();
    return meals;
  }

  String get transportationSelected
  {
    switch (selectedTransportation) {
      case Transportation.car:
        return 'By Car';
      case Transportation.plane:
        return 'By Plane';
      case Transportation.boat:
        return 'By Boat';
      case Transportation.submarine:
        return 'By Submarine';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Enable aditional controls'),
            value: isDeveloperMode,
            onChanged: (value) => setState(() {
                  isDeveloperMode = !isDeveloperMode;
                })),

        ExpansionTile(
          title: const Text("Select Transportation"),
          subtitle: Text(transportationSelected),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Traveling by Car'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Traveling by Plane'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Traveling by Boat'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Traveling by Submarine'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),

        ExpansionTile(
          title: const Text("Select Meals"),
          subtitle: Text(mealsSelected()),
          children: [
            CheckboxListTile(
              title: const Text('Wants Breakfast?'),
              subtitle: const Text('Select if you want Breakfast'),
              value: wantsBreakfast,
              onChanged: (value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              }),
            ),
            CheckboxListTile(
              title: const Text('Wants Lunch?'),
              subtitle: const Text('Select if you want Lunch'),
              value: wantsLunch,
              onChanged: (value) => setState(() {
                wantsLunch = !wantsLunch;
              }),
            ),
            CheckboxListTile(
              title: const Text('Wants Dinner?'),
              subtitle: const Text('Select if you want Dinner'),
              value: wantsDinner,
              onChanged: (value) => setState(() {
                wantsDinner = !wantsDinner;
              }),
            ),
          ],
        ),

      ],
    );
  }
}
