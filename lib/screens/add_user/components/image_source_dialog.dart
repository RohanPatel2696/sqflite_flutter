//======= FLUTTER IMPORTS =======//
import 'package:flutter/material.dart';

//======= PACKAGE IMPORTS =======//
import 'package:nb_utils/nb_utils.dart';

//======= PROJECT IMPORTS =======//
import '../../../utils/export_utils.dart';

class ImageSourceDialog extends StatefulWidget {
  final Function()? onGallery;
  final Function()? onCamera;
  final Function()? onFile;
  final bool isFile;

  ImageSourceDialog({this.onGallery, this.onCamera, this.onFile, this.isFile = false});

  @override
  State<ImageSourceDialog> createState() => _ImageSourceDialogState();
}

class _ImageSourceDialogState extends State<ImageSourceDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(StringConst.selectSources, style: boldTextStyle(size: 18)),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.cancel_outlined)),
            ],
          ),
          16.height,
          InkWell(
            onTap: widget.onGallery ?? () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.photo_camera_back, color: Colors.black),
                  8.width,
                  Text(StringConst.gallery, style: primaryTextStyle()),
                ],
              ),
            ),
          ),
          const Divider(height: 16),
          InkWell(
            onTap: widget.onCamera ?? () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.camera_alt_outlined, color: Colors.black),
                  8.width,
                  Text(StringConst.camera, style: primaryTextStyle()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
