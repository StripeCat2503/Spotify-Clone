import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/src/core/view_models/base_viewmodel.dart';

class BaseScreen<T extends BaseViewModel> extends HookConsumerWidget {
  const BaseScreen({
    Key? key,
    required this.provider,
    required this.child,
    this.refeshState = true,
  }) : super(key: key);

  final bool refeshState;
  final T provider;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (refeshState) {
      final vm = ref.read<T>(
        ChangeNotifierProvider<T>(
          (ref) => provider,
        ),
      );

      useEffect(
        () {
          return () => vm.refresh();
        },
        [],
      );
    }

    return child;
  }
}
