import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/gen/colors.gen.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignUpAppBar({
    Key? key,
    this.onBack,
  }) : super(key: key);

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _title,
      leading: _leading(context),
    );
  }

  Widget get _title {
    return Text(
      'Create account',
      style: TextStyle(
        color: ColorName.originalWhite,
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
      ),
    );
  }

  Widget _leading(BuildContext context) {
    return InkWell(
      onTap: onBack,
      child: SvgPicture.asset(
        Assets.icons.svg.chervonLeftCircle.path,
        fit: BoxFit.scaleDown,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
