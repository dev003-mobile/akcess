import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../exports/auth_exports.dart';

class ChooseYourPictureScreen extends StatefulWidget {
  ChooseYourPictureScreen({super.key});

  final FinishSignUpStore _store = GetIt.I.get<FinishSignUpStore>();

  @override
  State<ChooseYourPictureScreen> createState() => _ChooseYourPictureScreenState();
}

class _ChooseYourPictureScreenState extends State<ChooseYourPictureScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget._store.hasMorePhotos = ValueNotifier<bool>(false);
    widget._store.isLoadingPhotos = ValueNotifier<bool>(false);
    widget._store.currentPagePhotos = ValueNotifier<int>(0);
    widget._store.images = ValueNotifier<List<Medium>>(<Medium>[]);

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        await widget._store.fetchGalleryPhotos();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget._store.images.dispose();
    widget._store.hasMorePhotos.dispose();
    widget._store.isLoadingPhotos.dispose();
    widget._store.currentPagePhotos.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * .04,
                  left: size.width * .07,
                  right: size.width * .07
                ),
                child: Text(
                  AppLocalizations.of(context)!.chooseAPhoto,
                  style: AppStyleDesign.fontStyleInter(
                    size: size.height * .035,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
              ),
            ).animate()
             .fadeIn(
              curve: Curves.fastEaseInToSlowEaseOut,
              duration: const Duration(milliseconds: 1500), 
            ),
            SizedBox(height: size.height * .06),
            SizedBox(
              child: ValueListenableBuilder<bool>(
                valueListenable: widget._store.isLoadingPhotos,
                builder: (_, isLoading, __) {
                  return ValueListenableBuilder<List<Medium>>(
                    valueListenable: widget._store.images,
                    builder: (_, value, __) {
                      return Visibility(
                        visible: value.isNotEmpty,
                        replacement: Padding(
                          padding: EdgeInsets.only(top: size.height * .3),
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 0.5,
                              color: Theme.of(context).colorScheme.secondary,
                            )
                          )
                        ),
                        child: GridView.builder(
                          controller: _scrollController, // Controlador de scroll
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                          ),
                          itemCount: value.length + (isLoading ? 1 : 0),
                          itemBuilder: (_, index) {
                            final Medium image = value[index];
                            return FutureBuilder(
                              future: image.getThumbnail(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                                  return Container(color: const Color(0xFFBF2121));
                                }
                                return Container(color: Colors.grey[300]);
                              },
                            );
                          },
                        ),
                      );
                    }
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}

  // if (index == value.length) {
  //   return Center(
  //     child: CircularProgressIndicator(
  //       strokeWidth: 0.5,
  //       color: Theme.of(context).colorScheme.secondary,
  //     )
  //   );
  // }