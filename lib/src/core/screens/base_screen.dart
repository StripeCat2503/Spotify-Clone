import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/src/core/providers/base_provider.dart';

class BaseScreen<T extends BaseProvider> extends HookConsumerWidget {
  const BaseScreen({
    Key? key,
    required this.child,
    this.provider,
    this.allowNativePop = true,
    this.refeshState = true,
    this.onBack,
  }) : super(key: key);

  final bool refeshState;
  final bool allowNativePop;
  final T? provider;
  final Widget child;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (refeshState && provider != null) {
      final vm = ref.read<T>(
        ChangeNotifierProvider<T>(
          (ref) => provider!,
        ),
      );

      useEffect(
        () {
          return () => vm.refresh();
        },
        [],
      );
    }

    return WillPopScope(
      child: child,
      onWillPop: () async {
        onBack?.call();

        return allowNativePop;
      },
    );
  }
}
