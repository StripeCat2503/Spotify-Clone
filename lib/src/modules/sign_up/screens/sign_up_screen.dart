import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/src/core/components/spotify_textfield.dart';
import 'package:spotify_clone/src/core/containers/scroll_view_container.dart';
import 'package:spotify_clone/src/modules/sign_up/widgets/sign_up_app_bar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SignUpAppBar(),
      body: ScrollViewContainer(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
        children: [
          SpotifyTextField(),
        ],
      ),
    );
  }
}
