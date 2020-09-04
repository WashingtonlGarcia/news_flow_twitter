import "package:flutter/material.dart";

// ignore: implementation_imports
import "package:flutter_cache_manager/src/result/download_progress.dart";
import "package:cached_network_image/cached_network_image.dart";

class CircleAvatarWidget extends StatelessWidget {
  final String imageUrl;

  const CircleAvatarWidget({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(360),
      child: Container(
        height: 50,
        width: 50,
        color: Theme.of(context).backgroundColor,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (BuildContext context, String url, DownloadProgress downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (BuildContext context, String url, dynamic error) => const Icon(Icons.person_outline),
        ),
      ),
    );
  }
}
