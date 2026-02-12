import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/image_cubit.dart';
import '../widget/image_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ImageCubit>().fetchImages();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<ImageCubit>().fetchImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Feed")),
      body: BlocBuilder<ImageCubit, ImageState>(
        builder: (context, state) {
          if (state is ImageLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ImageError) {
            return Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.read<ImageCubit>().fetchImages(),
                child: const Text("Retry"),
              ),
            );
          }

          if (state is ImageLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ImageCubit>().fetchImages(isRefresh: true);
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.images.length,
                itemBuilder: (context, index) {
                  return ImageCard(image: state.images[index]);
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
