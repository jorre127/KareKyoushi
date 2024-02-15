import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/viewmodel/base_screen/base_screen_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen_content.dart';
import 'package:kare_kyoushi/widget/base_screen/kare_kyoushi_header.dart';
import 'package:kare_kyoushi/widget/general/status_bar.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_progress_indicator.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

class BaseScreen extends StatelessWidget {
  final bool showProfile;
  final bool isScrollable;
  final bool useSlivers;
  final bool showHeader;
  final bool isLoading;
  final bool hasBottomSafeSpace;
  final Widget? overlayWidget;
  final int? itemCount;
  final Color? background;
  final String? title;
  final Widget? titleWidget;
  final Widget? child;
  final EdgeInsets padding;
  final List<Widget> children;
  final VoidCallback? onBackTapped;
  final IndexedWidgetBuilder? itemBuilder;
  final AsyncCallback? onRefresh;

  const BaseScreen({
    required this.children,
    this.titleWidget,
    this.onRefresh,
    this.overlayWidget,
    this.isLoading = false,
    this.hasBottomSafeSpace = true,
    this.onBackTapped,
    this.title,
    this.showHeader = false,
    this.isScrollable = false,
    this.useSlivers = false,
    this.showProfile = true,
    this.padding = const EdgeInsets.all(16),
    this.background,
    super.key,
  })  : child = null,
        itemBuilder = null,
        itemCount = null;

  const BaseScreen.builder({
    required this.itemBuilder,
    required this.itemCount,
    this.titleWidget,
    this.onRefresh,
    this.overlayWidget,
    this.isLoading = false,
    this.hasBottomSafeSpace = true,
    this.onBackTapped,
    this.title,
    this.showHeader = true,
    this.showProfile = true,
    this.padding = const EdgeInsets.all(16),
    this.background,
    super.key,
  })  : children = const [],
        child = null,
        useSlivers = false,
        isScrollable = true;

  const BaseScreen.slivers({
    required this.children,
    this.titleWidget,
    this.onRefresh,
    this.overlayWidget,
    this.hasBottomSafeSpace = true,
    this.onBackTapped,
    this.isLoading = false,
    this.title,
    this.showHeader = true,
    this.showProfile = true,
    this.padding = const EdgeInsets.all(16),
    this.background,
    super.key,
  })  : child = null,
        useSlivers = true,
        isScrollable = true,
        itemBuilder = null,
        itemCount = null;

  const BaseScreen.child({
    required this.child,
    this.titleWidget,
    this.onRefresh,
    this.overlayWidget,
    this.isLoading = false,
    this.hasBottomSafeSpace = true,
    this.onBackTapped,
    this.title,
    this.showHeader = true,
    this.showProfile = true,
    this.padding = const EdgeInsets.all(16),
    this.background,
    super.key,
  })  : children = const [],
        isScrollable = false,
        useSlivers = false,
        itemBuilder = null,
        itemCount = null;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<BaseScreenViewModel>(
      create: () => getIt.get(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => StatusBar.dark(
        child: Scaffold(
          backgroundColor: theme.colorsTheme.bgDefault,
          body: GestureDetector(
            onTap: FocusManager.instance.primaryFocus?.unfocus,
            child: Stack(
              children: [
                SafeArea(
                  top: !showHeader,
                  bottom: hasBottomSafeSpace,
                  child: isLoading
                      ? const Center(
                          child: KKProgressIndicator.dark(),
                        )
                      : Column(
                          children: [
                            if (showHeader) ...[
                              KKHeader(
                                title: title,
                                titleWidget: titleWidget,
                                onBackTapped: onBackTapped ?? viewModel.onBackTapped,
                              ),
                            ],
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final content = BaseScreenContent(
                                    isScrollable: isScrollable,
                                    padding: padding,
                                    useSlivers: useSlivers,
                                    children: children,
                                    child: child,
                                    itemBuilder: itemBuilder,
                                    itemCount: itemCount,
                                  );
                                  if (onRefresh == null) return content;
                                  return RefreshIndicator(
                                    onRefresh: onRefresh!,
                                    child: content,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ),
                if (overlayWidget != null) overlayWidget!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
