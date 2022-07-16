import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:spotify_clone/gen/colors.gen.dart';

class SpotifyCheckbox extends StatelessWidget {
  const SpotifyCheckbox({
    Key? key,
    this.checked = true,
    required this.onChanged,
  }) : super(key: key);

  final bool checked;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return RoundCheckBox(
      isChecked: checked,
      size: 24.w,
      border: Border.all(
        color: checked ? Colors.transparent : ColorName.greyLight,
        width: 2,
      ),
      animationDuration: const Duration(milliseconds: 200),
      checkedWidget: Icon(
        Icons.check,
        color: ColorName.white,
        size: 12.w,
      ),
      onTap: onChanged,
    );
  }
}
