import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>> [
  { 'elevation': 0.0, 'label': 'Elavation 0'},
  { 'elevation': 1.0, 'label': 'Elevation 1'},
  { 'elevation': 2.0, 'label': 'Elevation 2'},
  { 'elevation': 3.0, 'label': 'Elevation 3'},
  { 'elevation': 4.0, 'label': 'Elevation 4'},
  { 'elevation': 5.0, 'label': 'Elevation 5'},
  { 'elevation': 6.0, 'label': 'Elevation 6'}
];

class CardsScreen extends StatelessWidget {

  static const String screenName = 'cards_screen';

  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cards Screen'),
        ),
        body: _CardsView()
    );
  }
}

class _CardsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map( (card) => _CardItem(label: card['label'], elevation: card['elevation'])),
          ...cards.map( (card) => _CardOutlineItem(label: card['label'], elevation: card['elevation'])),
          ...cards.map( (card) => _CardFilledItem(label: card['label'], elevation: card['elevation'])),
          ...cards.map( (card) => _ImageCardItem(label: card['label'], elevation: card['elevation'])),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardItem({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              )
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            ),
        ]),
      ),
    );
  }
}

class _CardOutlineItem extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardOutlineItem({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          color: colors.outline,
          width: 1
        ),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              )
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            ),
        ]),
      ),
    );
  }
}

class _CardFilledItem extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardFilledItem({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              )
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - filled'),
            ),
        ]),
      ),
    );
  }
}

class _ImageCardItem extends StatelessWidget {
  final String label;
  final double elevation;

  const _ImageCardItem({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${ elevation.toInt() }/600/350',
            fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            )
          ),
      ]),
    );
  }
}
