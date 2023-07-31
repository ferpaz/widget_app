import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTutorialScreen extends StatefulWidget {
  static const String screenName = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();

  bool endReached = false;
  int activePage = 0;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      var page = pageViewController.page ?? 0;

      if (page.round() != activePage)
      {
        setState(() => activePage = page.round());
      }

      if (!endReached && (page >= slides.length - 1.5))
      {
        setState(() => endReached = true);
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slide) => _Slide(slide)).toList(),
          ),

          Positioned(
            top: 30,
            right: 20,
            child: Center(
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop('/'),
             )
            ),
          ),

          Positioned(
            bottom: 70,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: slides.map((slide) => _Dot(
                active: slides.indexOf(slide) == activePage,
                onTap: () => pageViewController.animateToPage(
                  slides.indexOf(slide),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                )
              )).toList(),
            ),
          ),

          endReached
            ? Positioned(
              bottom: 10,
              right: 20,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  child: const Text("Comenzar"),
                  onPressed: () => context.pop('/'),
                ),
              ),
            )
            : const SizedBox(),

        ]
      )
    );
  }
}


final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Lorem consectetur anim velit magna adipisicing deserunt aliquip aliquip enim. Nulla magna quis aliqua pariatur amet labore. Amet magna labore irure reprehenderit labore anim nostrud excepteur ut laborum Lorem qui esse.', 'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Magna minim anim ex quis commodo. Fugiat eiusmod aliquip aliquip deserunt incididunt. Exercitation eiusmod culpa id ipsum culpa et Lorem dolore consectetur dolore in veniam officia cupidatat. Excepteur qui sunt ut non mollit elit nostrud sint eiusmod duis magna enim.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Ipsum Lorem sint incididunt reprehenderit proident consectetur commodo minim officia consequat non. Aliquip ad pariatur veniam ad exercitation aute minim consectetur. Est sit consequat Lorem enim. Aliquip aliqua laborum quis anim adipisicing magna eiusmod.', 'assets/images/3.png'),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title,
    this.caption,
    this.imageUrl
  );
}

class _Slide extends StatelessWidget {
  final SlideInfo slide;

  const _Slide(this.slide) ;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final subTitleStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 350,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.inversePrimary, width: 4),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(slide.imageUrl),
                fit: BoxFit.cover,
              ),
            )
          ),
          const SizedBox(height: 20),
          Text(slide.title, style: titleStyle),
          const SizedBox(height: 20),
          Text(slide.caption, style: subTitleStyle),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool active;
  final Function()? onTap;

  const _Dot({this.active = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: active ? 8 : 6,
            backgroundColor: active ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.primary,
          )
        ),
      ],
    );
  }
}