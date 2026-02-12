import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/image_models.dart';

class DetailScreen extends StatelessWidget {
  final ImageModel image;

  const DetailScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: image.id,
          child: InteractiveViewer(
            child: CachedNetworkImage(
              imageUrl: image.downloadUrl,
            ),
          ),
        ),
      ),
    );
  }
}
