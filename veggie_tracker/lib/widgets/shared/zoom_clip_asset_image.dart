import 'package:flutter/widgets.dart';

/// A widget which zooms and clips an image asset
class ZoomClipAssetImage extends StatelessWidget {
  /// The zoom factor
  final double zoom;
  
  /// The width
  final double width;
  
  /// The height
  final double height;

  /// A path to the image asset
  final String imageAsset;

  /// Constructor
  const ZoomClipAssetImage(
      {@required this.zoom,
      this.height,
      this.width,
      @required this.imageAsset});

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      child: ClipRect(
        child: OverflowBox(
          maxHeight: height * zoom,
          maxWidth: width * zoom,
          child: Image.asset(
            imageAsset,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
