import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicPlayerArtImage extends StatelessWidget {
  const MusicPlayerArtImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.05.sh),
      child: Image.network(
        'https://images.theconversation.com/files/457052/original/file-20220408-15-pl446k.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip',
        height: 360.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
