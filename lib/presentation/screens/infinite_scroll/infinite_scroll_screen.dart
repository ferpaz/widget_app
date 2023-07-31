import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String screenName = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  bool firstTime = true;
  bool isLoading = false;
  bool isMounted = true;

  List<int> imagesIds = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 500 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  void _addFiveImages()
    => imagesIds.addAll(
          [1, 2, 3, 4, 5].map((e) => imagesIds.last + e)   // mapea el arreglo constante para sumarle un valor a lastId
       );

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    if (isMounted) setState(() {});

    // esperamos dos segundos para simular que se está obtienedo del internet
    await Future.delayed(const Duration(seconds: 2));

    _addFiveImages();
    isLoading = false;

    if (isMounted) {
      setState(() {});
      moveScrollToBottom();
    }
  }

  Future refreshImages() async {
    isLoading = true;
    if (isMounted) setState(() {});

    final lastId = imagesIds.last;
    imagesIds.clear();

    // esperamos dos segundos para simular que se está obtienedo del internet
    await Future.delayed(const Duration(seconds: 2));

    imagesIds.add(lastId + 1);
    _addFiveImages();
    isLoading = false;

    if (isMounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: RefreshIndicator(
          onRefresh: refreshImages,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300')
              );
            }),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        // child: ,
        child: isLoading
          ? SpinPerfect(
            infinite: true,
            child: const Icon(Icons.refresh_rounded),
          )
          : FadeIn(child: const Icon(Icons.arrow_back))
      ),
    );
  }
}